class Product < ApplicationRecord
  has_many :available_products
  validates :name, :description, presence: true
end
