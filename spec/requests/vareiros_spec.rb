require 'rails_helper'

RSpec.describe "Vareiros", type: :request do
  describe "GET /vareiros" do
    it "works! (now write some real specs)" do
      get vareiros_path
      expect(response).to have_http_status(200)
    end
  end
end
