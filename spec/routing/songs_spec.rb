require 'spec_helper'

describe "routing to songs" do
  it "routes /songs to songs#index" do
  	expect(get: "/songs").to route_to(
  	  controller: "songs",
  	  action: "index"
  	)
  end
  
  it "routes /songs/1 to songs#show" do
  	expect(get: "/songs/1").to route_to(
  	  controller: "songs",
  	  action: "show",
  	  id: "1"
  	)
  end
  
  it "routes /songs/new to songs#new" do
  	expect(get: "/songs/new").to route_to(
  	  controller: "songs",
  	  action: "new"
  	)
  end
  
  it "routes /songs to songs#create" do
  	expect(post: "/songs").to route_to(
  	  controller: "songs",
  	  action: "create"
  	)
  end
  
  it "routes /songs/1/edit to songs#edit" do
  	expect(get: "/songs/1/edit").to route_to(
  	  controller: "songs",
  	  action: "edit",
  	  id: "1"
  	)
  end
  
  it "routes /songs/1 to songs#update" do
  	expect(put: "/songs/1").to route_to(
  	  controller: "songs",
  	  action: "update",
  	  id: "1"
  	)
  end
  
  it "routes /songs/1 to songs#destroy" do
  	expect(delete: "/songs/1").to route_to(
  	  controller: "songs",
  	  action: "destroy",
  	  id: "1"
  	)
  end
end