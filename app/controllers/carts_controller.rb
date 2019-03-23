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
    token = params[:stripeToken]
    @carts = Cart.where(order_id: 0, user_id: current_user.id) #this checks all orders which haven't been paid for and belong to the current user logged in
    @total = Cart.where(user_id: current_user.id, order_id: 0).sum('subtotal') #finds this total value of the transaction by adding all of the subtotals up

    begin

      charge = Stripe::Charge.create(
        amount: @total.to_i,
        currency: "gbp",
        source: token,
        description: 'Payment Processed',
        receipt_email: params[:stripeEmail]
      )

      if charge.paid #this is what happens if the payment is succesful
        @order = Order.create(user_id: current_user.id, Street: current_user.streetname, City: current_user.city,
        Postcode: current_user.postcode, total: @total) #creates order
        Cart.where(order_id: 0, user_id: current_user.id).update_all(order_id: @order.id) #updates rows in cart table with the correct order_id
        flash[:notice] = "Payment Succesful"
        flash[:success] = "Order (Number 000#{@order.id}) is being processed and dealt with"
        # for the confirmation email
        @carts = Cart.where(order_id: @order.id)
        @user = current_user
        @products = Product.all
        UserMailer.purchase_confirmation(@user.email, @carts, @total, @order, @user, @products).deliver_now

      end

    rescue Stripe::CardError => e
      #The card has been declined
      redirect_to(payments_show_path)
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

    end

    # @orders = Order.where(user_id: current_user.id)


  end

end
