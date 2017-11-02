require 'rails_helper'

RSpec.describe ApiController, type: :controller do

  describe "GET #current_rate" do
    it "returns http success" do
      get :current_rate
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #currency_rates" do
    it "returns http success" do
      get :currency_rates
      expect(response).to have_http_status(:success)
    end
  end

end
