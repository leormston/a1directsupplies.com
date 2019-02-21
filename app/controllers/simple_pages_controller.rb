class SimplePagesController < ApplicationController
  def index
    @products = Product.where(display: true).limit(4)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    @messagebody = "Name: #{@name}\n" + "Phone: #{@phone}\n" + "Email: #{@email}\n" + "Message: #{@message}"
    UserMailer.contact_form(@email, @name, @messagebody).deliver_now
  end
end
