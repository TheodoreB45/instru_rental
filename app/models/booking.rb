class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :price, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
