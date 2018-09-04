class Users::SessionsController < Devise::SessionsController

  protected
  def after_sign_in_path_for(resource)
    if current_user.cart.present?
      session[:carts] ||= {}
      session[:carts].merge!(current_user.cart.items) { |key, oldval, newval| oldval + newval } if current_user.cart.items.present?
      current_user.cart.items = session[:carts]
      current_user.cart.save!
    end
    super(resource)
  end
end
