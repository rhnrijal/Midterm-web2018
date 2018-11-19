FactoryBot.define do
  factory :admin, class: User do
    email 'admin@ait'
    password 'password'
    password_confirmation 'password'
    is_admin? true
    is_cashier? false

  end

  factory :user do
    email 'user@ait'
    password 'password'
    password_confirmation 'password'
    is_admin? false
    is_cashier? false
  end

  factory :account do
    number '123456'
    balance 2400.0
  end

end