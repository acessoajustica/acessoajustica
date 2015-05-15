require 'rails_helper'

RSpec.describe "Calouros", type: :request do
  describe "GET /calouros" do
    it "works! (now write some real specs)" do
      get calouros_path
      expect(response).to have_http_status(200)
    end
  end
end
