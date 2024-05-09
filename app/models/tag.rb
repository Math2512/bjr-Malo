class Tag < ApplicationRecord

    validates :id, uniqueness: true
    

    has_many :post_tags
    has_many :posts, through: :post_tags

    before_create :generate_unique_id

    private

    def generate_unique_id
        #
    end
    
end
