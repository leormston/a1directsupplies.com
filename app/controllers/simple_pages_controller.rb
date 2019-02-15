class SimplePagesController < ApplicationController
  def index
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    @messagebody = "Name: #{@name}\n" + "Phone: #{@phone}\n" + "Email: #{@email}\n" + "Message: #{@message}"
    ActionMailer::Base.mail(from: @email,
      to: 'sales@a1directsupplies.co.uk',
      subject: "A new contact form message from #{@name}",
      body: @messagebody).deliver_now
  end
end
