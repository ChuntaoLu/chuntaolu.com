require "spec_helper"

describe MoocsController do
  describe "routing" do

    it "routes to #index" do
      get("/moocs").should route_to("moocs#index")
    end

    it "routes to #new" do
      get("/moocs/new").should route_to("moocs#new")
    end

    it "routes to #edit" do
      get("/moocs/1/edit").should route_to("moocs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/moocs").should route_to("moocs#create")
    end

    it "routes to #update" do
      put("/moocs/1").should route_to("moocs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/moocs/1").should route_to("moocs#destroy", :id => "1")
    end

  end
end
