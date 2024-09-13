require 'rails_helper'

RSpec.describe "Passwords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get passwords_path
      expect(response).to have_http_status(:success)
    end
  end
end
