class ContactMailer < ActionMailer::Base
  # Sets default recipient email address.
  default :to => "ryanpitts1@gmail.com"
  
  # Sends email to recipient.
  def contact_email(contact)
    @contact = contact
    mail(from: contact.email, subject: "Contact Form")
  end
end