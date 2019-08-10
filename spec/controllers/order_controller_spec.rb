require 'spec_helper'
require 'rails_helper'

RSpec.describe OrderController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #reports" do
    it "returns a success response" do
      get :reports
      expect(response).to have_http_status(:success)
    end
  end
end