require 'rails_helper'

RSpec.describe "Estagiarios", type: :request do
  describe "GET /estagiarios" do
    it "works! (now write some real specs)" do
      get estagiarios_path
      expect(response).to have_http_status(200)
    end
  end
end
