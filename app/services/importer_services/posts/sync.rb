class ImporterServices::Posts::Sync
    def initialize(file_path)
        @file_path = file_path
    end

    def perform
        data_importer = ImporterServices::Posts::Concerns::Data.new  
        data_importer.import_from_json(@file_path) 
    end
end