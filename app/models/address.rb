class Address < ApplicationRecord
  belongs_to :user
  has_many :sends
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name, :postal_code, :prefecture_id, :town, :address, :tel, :user
    validates :prefecture_id, numericality: { other_than: 0, message: 'You need to select' }
    validates :prefecture_id, numericality: { less_than: Prefecture.count, message: 'valid' }    
  end
end
