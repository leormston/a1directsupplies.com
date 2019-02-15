class ApplicationMailer < ActionMailer::Base
  default from: 'l.e.ormston@gmail.com'
  layout 'mailer'
  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'sales@a1directsupplies.co.uk',
         subject: "A new contact form message from #{name}")
  end
end
