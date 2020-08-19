class Product < ApplicationRecord
  has_many :items
  has_many :products_genres
  has_many :reviews
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, through: :products_genres

end
