require 'spec_helper'
include Warden::Test::Helpers

describe "Layout" do
  subject { page }
  
  describe "Navigation Menu with signed out user" do
  	before { visit root_path }
  	it { should have_selector('a', text: 'Members') }
  	it { should have_link('Register', href: new_user_registration_path) }
  	it { should have_link('Sign In', href: new_user_session_path) }
  	
  	it { should_not have_link('Profile', href: edit_user_registration_path) }
  	it { should_not have_link('Sign Out', href: destroy_user_session_path) }
  	it { should_not have_link('Songs', href: songs_path) }
  	it { should_not have_link('Arrangements', href: song_arrangements_path) }
  	it { should_not have_link('Attachments', href: song_arrangement_files_path) }
  end
  
  describe "Navigation Menu with signed in user" do
  	before do
      @user = FactoryGirl.create(:user, :admin)
      login_as @user, :scope => :user
    end
    before { visit root_path }
  	
  	it { should have_selector('a', text: "#{@user.name}") }
  	it { should have_link('Profile', href: edit_user_registration_path) }
  	it { should have_link('Sign Out', href: destroy_user_session_path) }
  	it { should have_link('Songs', href: songs_path) }
  	it { should have_link('Arrangements', href: song_arrangements_path) }
  	it { should have_link('Attachments', href: song_arrangement_files_path) }
  	
  	it { should_not have_selector('a', text: 'Members') }
  	it { should_not have_link('Register', href: new_user_registration_path) }
  	it { should_not have_link('Sign In', href: new_user_session_path) }
  end
end
