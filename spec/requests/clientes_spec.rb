require 'rails_helper'

RSpec.describe "Clientes", type: :request do
  describe "GET /clientes" do
    before(:each) do 
      sign_in_user
    end
    it "works! (now write some real specs)" do
      get clientes_path
      expect(response).to have_http_status(200)
    end
  end
end
