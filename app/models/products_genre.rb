class ProductsGenre < ApplicationRecord
  belongs_to :product
  belongs_to :genre
  
  with_options presence: true do
    validates :product, :genre
  end
end
