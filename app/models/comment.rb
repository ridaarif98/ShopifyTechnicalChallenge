class Comment < ApplicationRecord
    belongs_to :item
    
    validates :text, presence: true, length: { minimum: 3 }
    # Registers a callback to be called after a record is created
end