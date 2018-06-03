require 'rails_helper'
require 'pry'

RSpec.describe "Invoices API" do
  it "returns a list of all invoices" do
    list = create_list(:invoice, 3)
    binding.pry
    get "/api/v1/invoices"

    expect(response).to be_success
    invoices = JSON.parse(response.body)

    invoice = invoices.first

    expect(invoices.count).to eq(3)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("status")
  end
end