class Send < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :address

  with_options presence: true do
    validates :item, :user, :address
  end
end
