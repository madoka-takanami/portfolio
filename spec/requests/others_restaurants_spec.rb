require 'rails_helper'

RSpec.describe "OthersRestaurants", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/others_restaurants/index"
      expect(response).to have_http_status(:success)
    end
  end

end
