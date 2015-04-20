require "rails_helper"

RSpec.describe MembrosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/membros").to route_to("membros#index")
    end

    it "routes to #new" do
      expect(:get => "/membros/new").to route_to("membros#new")
    end

    it "routes to #show" do
      expect(:get => "/membros/1").to route_to("membros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/membros/1/edit").to route_to("membros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/membros").to route_to("membros#create")
    end

    it "routes to #update" do
      expect(:put => "/membros/1").to route_to("membros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/membros/1").to route_to("membros#destroy", :id => "1")
    end

  end
end
