class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references  :user, null: false, foreign_key: true
      t.references  :item, null: false, foreign_key: true
      t.boolean     :buy, default: true
      t.timestamps
    end
  end
end
