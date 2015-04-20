require 'rails_helper'

RSpec.describe "Membros", type: :request do
  describe "GET /membros" do
    it "works! (now write some real specs)" do
      get membros_path
      expect(response).to have_http_status(200)
    end
  end
end
