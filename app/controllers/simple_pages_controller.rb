class SimplePagesController < ApplicationController
  def index
    @products = Product.where(display: true).limit(4)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @phone, @message).deliver_now
  end
end
