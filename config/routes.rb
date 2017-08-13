Rails.application.routes.draw do
  devise_for :users
  get 'referral/index'

  get 'referral/new'

  root 'referral#index'
end
