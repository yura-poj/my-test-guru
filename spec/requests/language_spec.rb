require 'rails_helper'

RSpec.describe "Languages", type: :request do
  describe "GET /change_language" do
    it "returns http success" do
      get "/language/change_language"
      expect(response).to have_http_status(:success)
    end
  end

end
