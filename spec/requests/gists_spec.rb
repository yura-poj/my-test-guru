require 'rails_helper'

RSpec.describe "Gists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/gists/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/gists/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/gists/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
