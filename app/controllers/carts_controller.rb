class CartsController < ApplicationController
  before_action :init, except: %i[empty]
  before_action :check_and_get_params_id
  after_action :sync_data
  def index
    @products = Product.where(id: session[:carts].keys)
  end

  def change_quatity
    if session[:carts].keys.include?(@product.id.to_s)
      if params[:quatity].to_i <= 0
        session[:carts].delete(@product.id.to_s)
      else
        session[:carts][@product.id.to_s] = params[:quatity].to_i
      end
    end
    @subTotal = @product.price * params[:quatity].to_i
  end

  def add
    if session[:carts].keys.include?(@product.id.to_s)
      session[:carts][@product.id.to_s] += 1
    else
      session[:carts][@product.id.to_s] = 1
    end
    @count = Product.where(id: session[:carts].keys).pluck.size
  end

  def delete
    if session[:carts].keys.include?(@product.id.to_s)
      session[:carts].delete(@product.id.to_s)
    end
    redirect_to cart_index_path
  end

  def empty
    session[:carts].clear
    sync_data
    redirect_to cart_index_path
  end
  private
    def init
      session[:carts] ||= Hash.new
    end

    def check_and_get_params_id
      return if params[:id].blank?
      @product = Product.find(params[:id].to_s)
    end

    def sync_data
      if current_user
        Cart.create(user: current_user) if current_user.cart.blank?
        current_user.cart.items = session[:carts] if session[:carts]
        current_user.cart.save!
      end
    end
end
