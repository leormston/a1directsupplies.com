class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]
  def index
    @carts = Cart.where.not(order_id: 0)
    @orders = Order.all
    @products = Product.all
    @user = User.all
  end
end
