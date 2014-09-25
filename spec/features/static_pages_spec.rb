require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Worship Tuner" }
  
  describe "Home page" do
  	it "should have the title 'Worship Tuner'" do
  		visit root_path
  		page.should have_title("#{base_title}")
  	end
  	
  	it "should have h1 'Welcome to Worship Tuner'" do
  		visit root_path
  		page.should have_selector('h1', text: 'Welcome to Worship Tuner')
  	end
  	
  	it "should have signup button" do
  		visit root_path
  		page.should have_link('Sign up now!', href: new_user_registration_path)
  	end
  end
  
  describe "Who We Are" do
  	it "should have the title 'Who We Are > Worship Tuner'" do
  		visit who_we_are_path
  		page.should have_title("Who We Are > #{base_title}")
  	end
  	
  	it "should have h1 'Who We Are'" do
  		visit who_we_are_path
  		page.should have_selector('h1', text: 'Who We Are')
  	end
  end
  
  describe "How it Works" do
  	it "should have the title 'How it Works > Worship Tuner'" do
  		visit how_it_works_path
  		page.should have_title("How it Works > #{base_title}")
  	end
  	
  	it "should have h1 'How it Works'" do
  		visit how_it_works_path
  		page.should have_selector('h1', text: 'How it Works')
  	end
  end
end
