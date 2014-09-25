require 'spec_helper'

describe "Contact" do
  let(:base_title) { "Worship Tuner" }
  subject { page }
  
  describe "contact page" do
  	before { visit contact_path }
  	
  	it { should have_title("Contact > #{base_title}") }
  end
end
