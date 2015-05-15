require "rails_helper"

RSpec.describe RelatosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/relatos").to route_to("relatos#index")
    end

    it "routes to #new" do
      expect(:get => "/relatos/new").to route_to("relatos#new")
    end

    it "routes to #show" do
      expect(:get => "/relatos/1").to route_to("relatos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/relatos/1/edit").to route_to("relatos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/relatos").to route_to("relatos#create")
    end

    it "routes to #update" do
      expect(:put => "/relatos/1").to route_to("relatos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/relatos/1").to route_to("relatos#destroy", :id => "1")
    end

  end
end
