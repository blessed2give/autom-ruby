Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:show] do
    resources :referrals, only: [:index, :new, :create]
  end
  authenticated :user do
    root 'referrals#index', as: :authenticated_root
  end
  root 'referrals#index'
end
