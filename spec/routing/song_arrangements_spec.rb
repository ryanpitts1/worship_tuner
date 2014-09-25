require 'spec_helper'

describe "routing to song_arrangements" do
  it "routes /song_arrangements to song_arrangements#index" do
  	expect(get: "/song_arrangements").to route_to(
  	  controller: "song_arrangements",
  	  action: "index"
  	)
  end
  
  it "routes /song_arrangements/1 to song_arrangements#show" do
  	expect(get: "/song_arrangements/1").to route_to(
  	  controller: "song_arrangements",
  	  action: "show",
  	  id: "1"
  	)
  end
  
  it "routes /song_arrangements/new to song_arrangements#new" do
  	expect(get: "/song_arrangements/new").to route_to(
  	  controller: "song_arrangements",
  	  action: "new"
  	)
  end
  
  it "routes /song_arrangements to song_arrangements#create" do
  	expect(post: "/song_arrangements").to route_to(
  	  controller: "song_arrangements",
  	  action: "create"
  	)
  end
  
  it "routes /song_arrangements/1/edit to song_arrangements#edit" do
  	expect(get: "/song_arrangements/1/edit").to route_to(
  	  controller: "song_arrangements",
  	  action: "edit",
  	  id: "1"
  	)
  end
  
  it "routes /song_arrangements/1 to song_arrangements#update" do
  	expect(put: "/song_arrangements/1").to route_to(
  	  controller: "song_arrangements",
  	  action: "update",
  	  id: "1"
  	)
  end
  
  it "routes /song_arrangements/1 to song_arrangements#destroy" do
  	expect(delete: "/song_arrangements/1").to route_to(
  	  controller: "song_arrangements",
  	  action: "destroy",
  	  id: "1"
  	)
  end
end