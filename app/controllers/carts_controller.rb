class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @carts = Cart.where(order_id: 0)
    id = params[:cart_id]
    if id
      @carts.find(id.to_i).destroy
    end
    @products = Product.all
    if params
      quantity = params[:quantity]
      product_id = params[:product_id]
      subtotal = quantity.to_f * product_id.to_f
      user_id = current_user.id
      subtotal = quantity.to_f * Product.where(id: product_id).pluck(:price).to_s.remove(']', '[', '"').to_f
      if quantity
        Cart.create(product_id: product_id, user_id: user_id, quantity: quantity, subtotal: subtotal, order_id: 0)
      end
      @carts = Cart.where(user_id: user_id, order_id: 0)
    else
      user_id = current_user.id
      @carts = Cart.where(user_id: user_id, order_id: 0)
    end
    @total = Cart.where(user_id: current_user.id, order_id: 0).sum('subtotal')
  end

  def show
    @user = current_user
    @carts = Cart.where(order_id: 0)
    id = params[:cart_id]
    if id
      @carts.find(id.to_i).destroy
    end
    @products = Product.all
    if params
      quantity = params[:quantity]
      product_id = params[:product_id]
      user_id = current_user.id

      subtotal = quantity.to_f * Product.where(id: product_id).pluck(:price).to_s.remove(']', '[', '"').to_f
      if quantity
        Cart.create(product_id: product_id, user_id: user_id, quantity: quantity, subtotal: subtotal, order_id: 0)
      end
      @carts = Cart.where(user_id: user_id, order_id: 0)
    else
      user_id = current_user.id
      @carts = Cart.where(user_id: user_id, order_id: 0)

    end
    @total = Cart.where(user_id: current_user.id, order_id: 0).sum('subtotal')
  end

  def checkout
    @carts = Cart.where(order_id: 0, user_id: current_user.id)
    @total = Cart.where(user_id: current_user.id, order_id: 0).sum('subtotal')
    @order = Order.create(user_id: current_user.id, Street: current_user.streetname, City: current_user.city,
    Postcode: current_user.postcode, total: @total)
    Cart.where(order_id: 0, user_id: current_user.id).update_all(order_id: @order.id)
    @orders = Order.where(user_id: current_user.id)

  end

end
