require "rails_helper"

RSpec.describe PessoasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pessoas").to route_to("pessoas#index")
    end

    it "routes to #new" do
      expect(:get => "/pessoas/new").to route_to("pessoas#new")
    end

    it "routes to #show" do
      expect(:get => "/pessoas/1").to route_to("pessoas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pessoas/1/edit").to route_to("pessoas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pessoas").to route_to("pessoas#create")
    end

    it "routes to #update" do
      expect(:put => "/pessoas/1").to route_to("pessoas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pessoas/1").to route_to("pessoas#destroy", :id => "1")
    end

  end
end
