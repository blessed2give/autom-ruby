Rails.application.routes.draw do
  devise_for :users
  resources :referrals, only: [:index, :new, :create]
  root 'referrals#index'
end
