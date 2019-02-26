class UserMailer < ApplicationMailer
  default from: 'l.e.ormston@gmail.com'
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

end
