require "rails_helper"

RSpec.describe ClientesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clientes").to route_to("clientes#index")
    end

    it "routes to #new" do
      expect(:get => "/clientes/new").to route_to("clientes#new")
    end

    it "routes to #show" do
      expect(:get => "/clientes/1").to route_to("clientes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clientes/1/edit").to route_to("clientes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clientes").to route_to("clientes#create")
    end

    it "routes to #update" do
      expect(:put => "/clientes/1").to route_to("clientes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clientes/1").to route_to("clientes#destroy", :id => "1")
    end

  end
end
