require "spec_helper"

describe ArticlesController do
  describe "routing" do

    it "routes to #index" do
      get("blog").should route_to("articles#index")
    end

    it "routes to #new" do
      get("blog/new").should route_to("articles#new")
    end

    it "routes to #show" do
      get("blog/1").should route_to("articles#show", :id => "1")
    end

    it "routes to #edit" do
      get("blog/1/edit").should route_to("articles#edit", :id => "1")
    end

    it "routes to #create" do
      post("blog").should route_to("articles#create")
    end

    it "routes to #update" do
      put("blog/1").should route_to("articles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("blog/1").should route_to("articles#destroy", :id => "1")
    end

  end
end
