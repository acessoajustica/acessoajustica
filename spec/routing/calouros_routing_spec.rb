require "rails_helper"

RSpec.describe CalourosController, type: :controller do
  before (:each) do
    sign_in FactoryGirl.create(:user, :admin_user) 
  end
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/calouros").to route_to("calouros#index")
    end

    it "routes to #new" do
      expect(:get => "/calouros/new").to route_to("calouros#new")
    end

    it "routes to #show" do
      expect(:get => "/calouros/1").to route_to("calouros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/calouros/1/edit").to route_to("calouros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/calouros").to route_to("calouros#create")
    end

    it "routes to #update" do
      expect(:put => "/calouros/1").to route_to("calouros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/calouros/1").to route_to("calouros#destroy", :id => "1")
    end

  end
end
