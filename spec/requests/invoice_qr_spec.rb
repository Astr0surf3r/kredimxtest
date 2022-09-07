require 'rails_helper'

RSpec.describe "InvoiceQrs", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/invoice_qr/show"
      expect(response).to have_http_status(:success)
    end
  end

end
