class Users::SessionsController < Devise::SessionsController

  protected
  def after_sign_in_path_for(resource)
    session[:carts] ||= {}
    session[:carts].merge!(current_user.cart.items) { |key, oldval, newval| oldval + newval } if current_user.cart.items.present?
    current_user.cart.items = session[:carts]
    current_user.cart.save!
    super(resource)
  end
end
