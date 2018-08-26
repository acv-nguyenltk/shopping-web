Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions' }
  root 'products#index'
  resource :products
end
