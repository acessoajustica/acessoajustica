require "rails_helper"

RSpec.describe CasosController, type: :controller do
  describe "routing" do
    before (:each) do
      sign_in FactoryGirl.create(:user, :admin_user) 
    end

    it "routes to #index" do
      expect(:get => "/casos").to route_to("casos#index")
    end

    it "routes to #new" do
      expect(:get => "/casos/new").to route_to("casos#new")
    end

    it "routes to #show" do
      expect(:get => "/casos/1").to route_to("casos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/casos/1/edit").to route_to("casos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/casos").to route_to("casos#create")
    end

    it "routes to #update" do
      expect(:put => "/casos/1").to route_to("casos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/casos/1").to route_to("casos#destroy", :id => "1")
    end

  end
end
