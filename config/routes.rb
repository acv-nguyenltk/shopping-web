Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations' }
  resource :products
end
