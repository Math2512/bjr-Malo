class ImportPostJob < ApplicationJob
    queue_as :perform_tools

    def perform(file_path)
        
    end
end