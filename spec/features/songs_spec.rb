require 'spec_helper'
include Warden::Test::Helpers

describe "Songs Library" do
  let(:base_title) { "Worship Tuner" }
  subject { page }
  
  describe "Index Page" do
    describe "with non-signed in user" do
      before(:each) { FactoryGirl.create_list(:song, 25) }
      before { visit songs_path }
      
      it { should have_title("Song Library > #{base_title}") }
      it { should have_link('2', href: '/songs?page=2') }
      
      it { should_not have_link('Manage') }
      it { should_not have_link('Delete') }
    end
    
    describe "with signed in non-admin user" do
      before do
        @user = FactoryGirl.create(:user)
        login_as @user, :scope => :user
      end
      before(:each) { FactoryGirl.create_list(:song, 25) }
      before { visit songs_path }
      
      it { should have_title("Song Library > #{base_title}") }
      it { should have_link('2', href: '/songs?page=2') }
      it { should have_link('Manage') }
      
      it { should_not have_link('Delete') }
    end
    
    describe "with signed in admin user" do
      before do
        @user = FactoryGirl.create(:user, :admin)
        login_as @user, :scope => :user
      end
    	before(:each) { FactoryGirl.create_list(:song, 25) }
    	before { visit songs_path }
    	
    	it { should have_title("Song Library > #{base_title}") }
    	it { should have_link('2', href: '/songs?page=2') }
    	it { should have_link('Manage') }
    	it { should have_link('Delete') }
    end
  end
end
