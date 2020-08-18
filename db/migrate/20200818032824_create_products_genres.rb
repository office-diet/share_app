class CreateProductsGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :products_genres do |t|
      t.references :product, null: false,  foreign_key: true
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
