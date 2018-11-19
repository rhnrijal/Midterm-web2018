class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :account_owners
  has_many :accounts, through: :account_owners
end

class Account < ApplicationRecord
  has_many :account_owners
  has_many :owners, through: :account_owners, source: 'user'
end
