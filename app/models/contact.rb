class Contact
  # Include classes for contact email.
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Accessible attributes for the Contact model.
  attr_accessor :full_name, :email, :message

  # Validations for the Contact model.
  validates :full_name, :email, :message, :presence => { message: "cannot be blank." }
  validates :email, :format => { :with => %r{.+@.+\..+}, message: "is not a valid email address." }, allow_blank: false
  
  # Initializer for the Contact model.
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # DO not persist model.
  def persisted?
    false
  end
end