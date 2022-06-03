class Item < ApplicationRecord
  
    validates :name, presence: true, length: { minimum: 3 }
    validates :quantity, numericality: { greater_than: 0, less_than: 1_000_000 }
    validates :price, numericality: { greater_than: 0, less_than: 1_000_000 }

  has_many :comments
  end
  