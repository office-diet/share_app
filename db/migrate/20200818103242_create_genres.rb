class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false, unique: true
      t.integer :order, null: false, default: 0
      t.timestamps
    end
  end
end
