class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :condition_id, null: false
      t.text :text, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
