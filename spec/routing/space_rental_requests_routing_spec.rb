require "spec_helper"

describe SpaceRentalRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/space_rental_requests").should route_to("space_rental_requests#index")
    end

    it "routes to #new" do
      get("/space_rental_requests/new").should route_to("space_rental_requests#new")
    end

    it "routes to #show" do
      get("/space_rental_requests/1").should route_to("space_rental_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/space_rental_requests/1/edit").should route_to("space_rental_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/space_rental_requests").should route_to("space_rental_requests#create")
    end

    it "routes to #update" do
      put("/space_rental_requests/1").should route_to("space_rental_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/space_rental_requests/1").should route_to("space_rental_requests#destroy", :id => "1")
    end

  end
end
