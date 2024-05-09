class ImporterServices::Posts::Concerns::Data
    def import_from_json(data)
        ActiveRecord::Base.transaction do
            import_posts(data["posts"])
        end
        puts "Data imported successfully!"
    rescue ActiveRecord::RecordInvalid => e
        puts "Error importing data: #{e.message}"
    end
    
    private
    def import_posts(posts_data)
        posts_data.each do |post_data|
            ActiveRecord::Base.transaction do
                post = create_post(post_data)
                import_tags(post, post_data["tags"])
            end
        end
    end
    def create_post(post_data)
        post = Post.new(
            id: post_data["id"],
            uuid: post_data["uuid"],
            title: post_data["title"],
            slug: post_data["slug"],
            comment_id: post_data["comment_id"],
            feature_image: post_data["feature_image"],
            visibility: post_data["visibility"],
            published_at: post_data["published_at"],
            custom_excerpt: post_data["custom_excerpt"],
            primary_tag_id: post_data["primary_tag"] == nil ? nil : post_data["primary_tag"]["id"],
            url: post_data["url"],
            excerpt: post_data["excerpt"],
            reading_time: post_data["reading_time"],
            access: post_data["access"],
            comments: post_data["comments"],
        )
        
        post.html = ActionText::Content.new(post_data["html"])
        post.save!
        post
    end
    def import_tags(post, tags_data)
        tags_data.each do |tag_data|
            unless tag_data["name"].start_with?("#")
                tag = Tag.find_or_create_by(id: tag_data["id"]) do |t|
                    t.id = tag_data["id"]
                    t.name = tag_data["name"]
                    t.slug = tag_data["slug"]
                    t.description = tag_data["description"]
                    t.feature_image = tag_data["feature_image"]
                    t.visibility = tag_data["visibility"]
                    t.url = tag_data["url"]
                end
                tag.save!
                unless post.tags.include?(tag)
                    post.tags << tag
                end
            end
        end
    end
end