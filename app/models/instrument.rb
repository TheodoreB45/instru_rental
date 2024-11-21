class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :condition, presence: true
end
