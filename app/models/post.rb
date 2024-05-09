class Post < ApplicationRecord


    validates :id, uniqueness: true
    
    has_rich_text :html

    belongs_to :primary_tag, class_name: 'Tag', foreign_key: 'primary_tag_id', optional: true

    has_many :post_tags
    has_many :tags, through: :post_tags


    before_create :generate_unique_id

    private

    def generate_unique_id
        #
    end

    scope :by_published_at, -> {
        order(published_at: :desc)
    }

    def self.search(query)
        if query.blank?
            self.by_published_at
        else
            sanitize_query = "%#{sanitize_sql_like(query)}%"
            self.by_published_at.joins(:tags).where("posts.title LIKE :query OR tags.name LIKE :query OR posts.excerpt LIKE :query", query: sanitize_query).distinct
        end
    end
    
end
