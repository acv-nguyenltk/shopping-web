class OrdersController < ApplicationController
  include PayPal::SDK::REST

  before_action :authenticate_user!
  def index
    @orders = current_user.orders.paginate(page: params[:page]).order(:created_at => :asc)
  end

  def create
    @payment = build_payment(current_user, execute_payment_orders_url, root_url)
    if @payment.create
      redirect_url = @payment.links.find {|link| link.rel == 'approval_url'}
      redirect_to redirect_url.href
    else
      redirect_to root_url, notice: @payment.error
    end
  end

  private
  def build_payment(current_user, return_url, cancel_url)
      @products = Product.where(id: current_user.cart.items.keys)
      items_list = []
      total_price
      @products.each do |product|
        items_list << {
          name: product.name,
          sku: product.id.to_s,
          price: product.price.to_s,
          currency: 'USD',
          quantity: current_user.cart.items[product.id.to_s]
        }
        total_price += product.price * current_user.cart.items[product.id.to_s]
      end
    Payment.new({
    intent:  'sale',
    payer:  {
      payment_method: 'paypal' },
    redirect_urls: {
      return_url: return_url,
      cancel_url: cancel_url },
    transactions:  [{
      item_list: {
        items: items_list},
      amount:  {
        total:  total_price,
        currency:  'USD' },
      description:  'This is the payment transaction from Nguyen shop.' }]})
  end
  def check_and_get_params_id
    return if params[:id].blank?
    @product = Product.find(params[:id].to_s)
  end
end
