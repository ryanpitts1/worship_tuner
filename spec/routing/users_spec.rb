require 'spec_helper'
include Warden::Test::Helpers

describe "routing to user profile" do
  before do
    @user = FactoryGirl.create(:user, :admin)
    login_as @user, :scope => :user
  end

  it "routes /users/edit to devise/registration#edit" do
  	expect(get: "/users/edit").to route_to(
  	  controller: "devise/registrations",
  	  action: "edit"
  	)
  end
  
  it "does not expose a list of users" do
  	expect(get: "/users").not_to be_routable
  end
end
