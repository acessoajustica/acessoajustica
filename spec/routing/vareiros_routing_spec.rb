require "rails_helper"

RSpec.describe VareirosController, type: :controller do
  describe "routing" do

    before (:each) do
      sign_in FactoryGirl.create(:user, :estagiario_user) 
    end

    it "routes to #index" do
      expect(:get => "/vareiros").to route_to("vareiros#index")
    end

    it "routes to #new" do
      expect(:get => "/vareiros/new").to route_to("vareiros#new")
    end

    it "routes to #show" do
      expect(:get => "/vareiros/1").to route_to("vareiros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vareiros/1/edit").to route_to("vareiros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vareiros").to route_to("vareiros#create")
    end

    it "routes to #update" do
      expect(:put => "/vareiros/1").to route_to("vareiros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vareiros/1").to route_to("vareiros#destroy", :id => "1")
    end

  end
end
