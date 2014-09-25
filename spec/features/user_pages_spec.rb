require 'spec_helper'
include Warden::Test::Helpers

describe "User Pages" do
  let(:base_title) { "Worship Tuner" }
  subject { page }
  
  describe "Profile Page" do
  	before do
      @user = FactoryGirl.create(:user, :admin)
      login_as @user, :scope => :user
    end
    before { visit edit_user_registration_path }
  	
  	it { should have_title("Update: #{@user.name} > #{base_title}") }
  	it { should have_selector('h1', text: "Update: #{@user.name}") }
  	it { should have_selector('h3', text: "Cancel My Account") }
  end
  
  describe "Authentication" do
  	describe "signin" do
  	  before { visit new_user_session_path }
  	  
  	  describe "with invalid information" do
  	  	before { click_button "Sign In" }
  	  	
  	  	it { should have_title("Sign In > #{base_title}") }
        it { should have_selector('div.alert.alert-alert', text: 'Invalid email address or password.') }
  	  end
  	  
  	  describe "with valid information" do
  	  	let(:user) { FactoryGirl.create(:user, :admin) }
  	  	before do
  	  		fill_in "Email", with: user.email
  	  		fill_in "Password", with: user.password
  	  		click_button "Sign In"
  	  	end
  	  	
  	  	it { should have_title("#{base_title}") }
        it { should have_link('Profile', href: edit_user_registration_path) }
        it { should have_link('Sign Out', href: destroy_user_session_path) }
        
        it { should_not have_link('Sign In', href: new_user_session_path) }
        
        describe "followed by signout" do
          before { click_link "Sign Out" }
          it { should have_link('Sign In') }
        end
  	  end
  	end
  	
  	describe "authorization" do
  	  describe "for non-signed-in users" do
  	  	let(:user) { FactoryGirl.create(:user, :admin) }
  	  	
  	  	describe "visiting the profile page" do
  	  	  before { visit edit_user_registration_path }
  	  		
  	  	  it { should have_title("Sign In > #{base_title}") }
  	  	end
  	  end
  	end
  end
end
