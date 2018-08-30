class CartsController < ApplicationController
  before_action :init
  before_action :get_cart
  after_action :sync_data
  def index
    @products = []
    session[:carts].each do |key, val|
      @products << Product.find(key)
    end
  end

  def change_quatity
    # binding.pry
    if session[:carts].keys.include?(@product.id.to_s)
      if params[:quatity].to_i <= 0
        session[:carts].delete(@product.id.to_s)
      else
        session[:carts][@product.id.to_s] = params[:quatity].to_i
      end
    end
    redirect_to cart_index_path
  end

  def add
    if session[:carts].keys.include?(@product.id.to_s)
      session[:carts][@product.id.to_s] += 1
    else
      session[:carts][@product.id.to_s] = 1
    end
  end

  def delete
    if session[:carts].keys.include?(@product.id.to_s)
      session[:carts].delete(@product.id.to_s)
    end
    redirect_to cart_index_path
  end

  def empty
    session[:carts].clear
    render :index
  end
  private
    def init
      session[:carts] ||= Hash.new
    end

    def get_cart
      return if params[:id].blank?
      @product = Product.find(params[:id].to_s)
    end

    def sync_data
      if current_user
        current_user.cart.items = session[:carts] if session[:carts]
        current_user.cart.save!
      end
    end

    def merge_data

    end
end
