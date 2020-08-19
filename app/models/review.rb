class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  with_options presence: true do
    validates :star, :text, :product, :user
  end
end
