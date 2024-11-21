class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :condition, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
