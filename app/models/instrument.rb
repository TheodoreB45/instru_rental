class Instrument < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :condition, presence: true
end
