class Group < ApplicationRecord
    has_rich_text :body


    belongs_to :client
end
