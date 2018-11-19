class Account < ApplicationRecord
  has_many :account_owners, dependent: :destroy
  validates_uniqueness_of :number
end
