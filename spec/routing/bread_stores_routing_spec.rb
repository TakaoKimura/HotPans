require "spec_helper"

describe BreadStoresController do
  describe "routing" do

    it "routes to #index" do
      get("/bread_stores").should route_to("bread_stores#index")
    end

    it "routes to #new" do
      get("/bread_stores/new").should route_to("bread_stores#new")
    end

    it "routes to #show" do
      get("/bread_stores/1").should route_to("bread_stores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bread_stores/1/edit").should route_to("bread_stores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bread_stores").should route_to("bread_stores#create")
    end

    it "routes to #update" do
      put("/bread_stores/1").should route_to("bread_stores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bread_stores/1").should route_to("bread_stores#destroy", :id => "1")
    end

  end
end
