class Account < ApplicationRecord
  has_secure_password

  has_many :transaction_deposits, :class_name => 'Transaction', :foreign_key => 'destination_id'
  has_many :transaction_withdrawals, :class_name => 'Transaction', :foreign_key => 'source_id'

  validates_uniqueness_of :id, case_sensitive: true
  validates :username, presence: true
  validates_uniqueness_of :username, case_sensitive: true
  validates :password, presence: true
  validates :balance, presence: true
  validates :balance, numericality: true
end
