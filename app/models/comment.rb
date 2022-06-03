class Comment < ApplicationRecord
    belongs_to :item
    has_many :comments, dependent: :destroy
  
    validates :text, presence: true, length: { minimum: 3 }
    # Registers a callback to be called after a record is created
end