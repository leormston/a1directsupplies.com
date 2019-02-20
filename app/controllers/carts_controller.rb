class CartsController < ApplicationController

  def index
    @carts = Cart.all
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
        Cart.create(product_id: product_id, user_id: user_id, quantity: quantity, subtotal: subtotal)
      end
      @carts = Cart.where(user_id: user_id)
    else
      user_id = current_user.id
      @carts = Cart.where(user_id: user_id)
    end
    @total = Cart.where(user_id: current_user.id).sum('subtotal')
  end

  def show
    @carts = Cart.all
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
        Cart.create(product_id: product_id, user_id: user_id, quantity: quantity, subtotal: subtotal)
      end
      @carts = Cart.where(user_id: user_id)
    else
      user_id = current_user.id
      @carts = Cart.where(user_id: user_id)

    end
    @total = Cart.where(user_id: current_user.id).sum('subtotal')
  end



end
