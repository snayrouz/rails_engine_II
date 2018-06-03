require 'rails_helper'

RSpec.describe "Invoice Item API" do
  xit "can return a list of all invoice items" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  xit "can return a single invoice item by id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(id)
  end
end