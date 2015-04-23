require "rails_helper"

RSpec.describe EstagiariosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/estagiarios").to route_to("estagiarios#index")
    end

    it "routes to #new" do
      expect(:get => "/estagiarios/new").to route_to("estagiarios#new")
    end

    it "routes to #show" do
      expect(:get => "/estagiarios/1").to route_to("estagiarios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/estagiarios/1/edit").to route_to("estagiarios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/estagiarios").to route_to("estagiarios#create")
    end

    it "routes to #update" do
      expect(:put => "/estagiarios/1").to route_to("estagiarios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/estagiarios/1").to route_to("estagiarios#destroy", :id => "1")
    end

  end
end
