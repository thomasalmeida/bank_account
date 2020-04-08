class Account < ApplicationRecord
  has_secure_password

  validates :id, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true
  validates :balance, presence: true
end
