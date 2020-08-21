class Item < ApplicationRecord
  belongs_to :product
  has_many :sends

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition

  with_options presence: true do
    validates :condition_id, :text, :product_id
  end

end
