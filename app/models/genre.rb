class Genre < ApplicationRecord
  has_many :products_genres
  has_many :products, through: :products_genres

  with_options presence: true do
    validates :card_token, :customer_token, :user
  end
end
