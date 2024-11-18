class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, uniqueness: true, presence: true
  validates :email, presence: true
end
