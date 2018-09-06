class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :phoneNumber, addresses_attributes: [:id, :line1, :line2, :city, :country_code, :state, :_destroy]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :phoneNumber, addresses_attributes: [:id, :line1, :line2, :city, :country_code, :state, :_destroy]])
  end
end
