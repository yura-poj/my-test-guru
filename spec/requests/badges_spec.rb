require 'rails_helper'

RSpec.describe "Badges", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/badges/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/badges/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/badges/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/badges/update"
      expect(response).to have_http_status(:success)
    end
  end

end
