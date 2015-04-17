require "spec_helper"

describe VolunteerApplicationsController do
  describe "routing" do

    it "routes to #index" do
      get("/volunteer_applications").should route_to("volunteer_applications#index")
    end

    it "routes to #new" do
      get("/volunteer_applications/new").should route_to("volunteer_applications#new")
    end

    it "routes to #show" do
      get("/volunteer_applications/1").should route_to("volunteer_applications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/volunteer_applications/1/edit").should route_to("volunteer_applications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/volunteer_applications").should route_to("volunteer_applications#create")
    end

    it "routes to #update" do
      put("/volunteer_applications/1").should route_to("volunteer_applications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/volunteer_applications/1").should route_to("volunteer_applications#destroy", :id => "1")
    end

  end
end
