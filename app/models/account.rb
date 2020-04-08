class Account < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :id, case_sensitive: true
  validates :username, presence: true
  validates_uniqueness_of :username, case_sensitive: true
  validates :password, presence: true
  validates :balance, presence: true
  validates :balance, numericality: true
end
