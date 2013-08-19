require "spec_helper"

describe BetaController do
  describe "routing" do

    it "routes to #index" do
      get("/beta").should route_to("beta#index")
    end

    it "routes to #new" do
      get("/beta/new").should route_to("beta#new")
    end

    it "routes to #show" do
      get("/beta/1").should route_to("beta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/beta/1/edit").should route_to("beta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/beta").should route_to("beta#create")
    end

    it "routes to #update" do
      put("/beta/1").should route_to("beta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/beta/1").should route_to("beta#destroy", :id => "1")
    end

  end
end
