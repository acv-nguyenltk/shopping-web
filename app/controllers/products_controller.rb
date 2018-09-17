class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def list
    @products = Product.all.order("id ASC")
  end

  def index
    @products = (Product.page params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    p product_params
    @product.update(product_params)
    render json: @product
  end
  private def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
