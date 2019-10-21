class AddQuantityToAvailableProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :available_products, :quantity, :integer, default: 0
  end
end
