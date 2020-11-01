require 'rails_helper'

RSpec.describe "Backlogs", type: :request do

  describe "GET /backlogs" do
    it "returns http success" do
      get "/backlogs"
      expect(response).to have_http_status(:success)
    end
  end

end
