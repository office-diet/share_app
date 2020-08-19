class Item < ApplicationRecord
  belongs_to :product
  has_many :send

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition

  with_options presence: true do
    validates :condition_id, :text, :product
  end

end
