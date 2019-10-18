class AvailableProduct < ApplicationRecord
  belongs_to :product
  belongs_to :color
  belongs_to :size

  validates :product_id, :color_id, :size_id, presence: true

end
