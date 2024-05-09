namespace :posts do
    desc "Enregistrer posts via fichier JSON"
    task process_json: :environment do
      file_path = Rails.root.join("lib", "tasks", "articles_simplified.json")
      json_data = File.read(file_path)
      data = JSON.parse(json_data)

      sync = ImporterServices::Posts::Sync.new(data)
      sync.perform
      puts "Data processing complete!"
    end
  end