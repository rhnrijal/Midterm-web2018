Rails.application.routes.draw do
  resources :accounts
  get 'site/index'
  root 'site#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
