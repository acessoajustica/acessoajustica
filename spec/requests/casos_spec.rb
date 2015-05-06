require 'rails_helper'

RSpec.describe "Casos", type: :request do
  describe "GET /casos" do
    it "works! (now write some real specs)" do
      get casos_path
      expect(response).to have_http_status(200)
    end
  end
end
