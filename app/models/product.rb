class Product < ApplicationRecord
  has_many :items
  has_many :reviews
  has_many :products_genres
  has_many :genres, through: :products_genres

  with_options presence: true do
    validates :name, :image
  end
end
