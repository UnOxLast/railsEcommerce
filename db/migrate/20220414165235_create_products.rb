class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :type_id
      t.integer :brand_id
      t.integer :stock
      t.decimal :price
      t.text :desc
      t.text :url_image

      t.timestamps
    end
  end
end
