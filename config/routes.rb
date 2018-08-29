Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root 'products#index'
  resource :products

  # Custom cart/session cart
  get 'carts' => 'carts#index', :as => 'cart_index'
  post 'carts' => 'carts#change_quatity', as: 'cart_change'
  post 'carts/add/:id' => 'carts#add', :as => 'cart_add'
  delete 'carts/remove/:id' => 'carts#delete', :as => 'cart_delete'
  delete 'carts/empty' => 'carts#empty', :as => 'empty_cart'
end
