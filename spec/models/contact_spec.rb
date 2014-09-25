require 'spec_helper'

describe Contact do
  before { @contact = Contact.new(full_name: "Example User", email: "exampleuser@example.com", message: "Test message.") }  
  subject { @contact }
  
  it { should respond_to(:full_name) }
  it { should respond_to(:email) }
  it { should respond_to(:message) }
end