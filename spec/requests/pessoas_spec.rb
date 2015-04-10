require 'rails_helper'

RSpec.describe "Pessoas", type: :request do
  describe "GET /pessoas" do
    it "works! (now write some real specs)" do
      get pessoas_path
      expect(response).to have_http_status(200)
    end
  end
end
