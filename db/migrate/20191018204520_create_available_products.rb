class CreateAvailableProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :available_products do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :size_id

      t.timestamps
    end
  end
end
