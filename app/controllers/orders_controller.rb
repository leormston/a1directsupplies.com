class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @products = Product.all
    @carts = Cart.where(order_id: params[:order_id])
    @order = Order.find(params[:order_id])
    @user = User.find(@order.user_id)
  end


end
