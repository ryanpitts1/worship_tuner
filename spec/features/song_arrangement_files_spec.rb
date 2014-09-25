require 'spec_helper'
include Warden::Test::Helpers

describe "Attachments Library" do
  let(:base_title) { "Worship Tuner" }
  subject { page }
  
  describe "Index Page" do
    describe "with non-signed in user" do
      before(:each) { FactoryGirl.create(:song_arrangement_with_song_arrangement_files) }
      before { visit song_arrangement_files_path }
      
      it { should have_title("Sign In > #{base_title}") }
      it { should have_selector('h1', text: "Sign In") }
      it { should have_selector('div.alert.alert-alert', text: 'You need to sign in or sign up before continuing.') }
          
      it { should_not have_title("Attachment Library > #{base_title}") }
      it { should_not have_link('5', href: '/song_arrangement_files?page=5') }
      it { should_not have_link('Manage') }
      it { should_not have_link('Delete') }
    end
    
    describe "with signed in non-admin user" do
      before do
        @user = FactoryGirl.create(:user)
        login_as @user, :scope => :user
      end
      before(:each) { FactoryGirl.create(:song_arrangement_with_song_arrangement_files) }
      before { visit song_arrangement_files_path }
      
      it { should have_title("Attachment Library > #{base_title}") }
      it { should have_link('5', href: '/song_arrangement_files?page=5') }
      it { should have_link('Manage') }
      
      it { should_not have_link('Delete') }
    end
    
    describe "with signed in admin user" do
    	before do
        @user = FactoryGirl.create(:user, :admin)
        login_as @user, :scope => :user
      end
      before(:each) { FactoryGirl.create(:song_arrangement_with_song_arrangement_files) }
    	before { visit song_arrangement_files_path }
    	
    	it { should have_title("Attachment Library > #{base_title}") }
      it { should have_link('5', href: '/song_arrangement_files?page=5') }
      it { should have_link('Manage') }
      it { should have_link('Delete') }
    end
  end
end