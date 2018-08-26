Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resource :products
end
