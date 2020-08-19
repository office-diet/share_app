class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.boolean :return, default: false

      t.timestamps
    end
  end
end
