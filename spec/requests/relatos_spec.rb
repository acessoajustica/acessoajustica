require 'rails_helper'

RSpec.describe "Relatos", type: :request do
  describe "GET /relatos" do
    it "works! (now write some real specs)" do
      get relatos_path
      expect(response).to have_http_status(200)
    end
  end
end
