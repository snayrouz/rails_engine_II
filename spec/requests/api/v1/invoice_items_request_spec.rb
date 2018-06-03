require 'rails_helper'

RSpec.describe "Invoice Item API" do
  it "can send a list of invoice items" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to have_key("id")
  end
end