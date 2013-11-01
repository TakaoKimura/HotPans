require "spec_helper"

describe BreadsController do
  describe "routing" do

    it "routes to #index" do
      get("/breads").should route_to("breads#index")
    end

    it "routes to #new" do
      get("/breads/new").should route_to("breads#new")
    end

    it "routes to #show" do
      get("/breads/1").should route_to("breads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/breads/1/edit").should route_to("breads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/breads").should route_to("breads#create")
    end

    it "routes to #update" do
      put("/breads/1").should route_to("breads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/breads/1").should route_to("breads#destroy", :id => "1")
    end

  end
end
