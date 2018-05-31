require 'rails_helper'

RSpec.describe  "Invoices API" do
  it "returns a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)

    create_list(:invoice, 5, merchant_id: merchant.id, customer_id: customer.id)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(invoices.count).to eq(5)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("status")
  end
end