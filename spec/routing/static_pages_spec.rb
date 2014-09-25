require 'spec_helper'

describe "routing to static pages" do
  it "routes /contact to contact#contact" do
  	expect(get: "/contact").to route_to(
  	  controller: "contact",
  	  action: "contact"
  	)
  end
  
  it "routes /contact to contact#contact" do
  	expect(post: "/contact").to route_to(
  	  controller: "contact",
  	  action: "contact_email"
  	)
  end
  
  it "routes / to static_pages#home" do
  	expect(get: "/").to route_to(
  	  controller: "static_pages",
  	  action: "home"
  	)
  end
  
  it "routes /who-we-are to static_pages#who_we_are" do
  	expect(get: "/who-we-are").to route_to(
  	  controller: "static_pages",
  	  action: "who_we_are"
  	)
  end
  
  it "routes /how-it-works to static_pages#how_it_works" do
  	expect(get: "/how-it-works").to route_to(
  	  controller: "static_pages",
  	  action: "how_it_works"
  	)
  end
end
