class AvailableProduct < ApplicationRecord
  belongs_to :product
  belongs_to :color
  belongs_to :size

  accepts_nested_attributes_for :product, update_only: true

  validates :color_id, :size_id, presence: true
end
