require "test_helper"

class ImporterServices::Post < ActiveSupport::TestCase
    def setup
        @file_path = load_sample_data

        @sample_data = JSON.parse(File.read(@file_path))
        @sync_service = ImporterServices::Posts::Sync.new(@file_path)
        @data_importer = ImporterServices::Posts::Concerns::Data.new 
    end
    
    test "perform must run successfully" do
        data_importer_mock = mock()
        data_importer_mock.expects(:import_from_json).with(@file_path).once 
        ImporterServices::Posts::Concerns::Data.expects(:new).returns(data_importer_mock) 
        @sync_service.perform 
    end

    test "import_from_json imports must run successfully" do
        assert_difference 'Post.count', @sample_data["posts"].size do
            @data_importer.import_from_json(@sample_data)
        end
    end

    private

    def load_sample_data
        Rails.root.join("lib", "tasks", "articles_simplified.json")
    end
end
