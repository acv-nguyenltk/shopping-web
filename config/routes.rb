Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root 'products#index'
  resource :products

  # Custom cart/session cart
  get 'cart' => 'cart#index', :as => 'cart_index'
  post 'cart' => 'cart#change_quatity', as: 'cart_change'
  post 'cart/add/:id' => 'cart#add', :as => 'cart_add'
  delete 'cart/remove/:id' => 'cart#delete', :as => 'cart_delete'
  delete 'cart/empty' => 'cart#empty', :as => 'empty_cart'
end
