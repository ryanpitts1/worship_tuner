class ContactController < ApplicationController
  # Builds a new contact object.
  def contact
    @contact = Contact.new
  end
  
  # Builds a new contact email object and sends the email.
  def contact_email
    @contact = Contact.new(params[:contact])
    
    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver
      flash[:info] = "Thank you for contacting Worship Tuner! We'll get back to you as soon as we can!"
      redirect_to contact_path
    else
      render 'contact'
    end
  end
end
