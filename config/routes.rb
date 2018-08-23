Rails.application.routes.draw do
  root 'products#index'
  resource :products
end
