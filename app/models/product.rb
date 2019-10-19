class Product < ApplicationRecord
  has_many :available_products
  validates :name, :description, presence: true
  accepts_nested_attributes_for :available_products
end
