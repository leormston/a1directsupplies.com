class UserMailer < ApplicationMailer
  default from: 'sales@a1directsupplies.co.uk'
  layout 'mailer'
  def contact_form(email, name, phone, message)
  @phone = phone
  @name = name
  @email = email
  @message = message
    mail(from: email,
         to: 'sales@a1directsupplies.co.uk',
         subject: "A new contact form message from #{name}")
  end

  def purchase_confirmation(email, carts, total, order, user, products)
  @email = email
  @carts = carts
  @total = total
  @order = order
  @user = user
  @products = products
    mail(from: 'sales@a1directsupplies.co.uk',
         to: @email,
         subject: "Order Confirmation #{@order.id}")
  end
end
