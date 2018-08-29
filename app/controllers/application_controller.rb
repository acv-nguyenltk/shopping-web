class ApplicationController < ActionController::Base
  def check_session
    session[:carts] ||= Hash.new
  end
end
