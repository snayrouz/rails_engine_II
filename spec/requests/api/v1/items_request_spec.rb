require 'rails_helper'

RSpec.describe "Items API" do
  it "can return a list of items" do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = items.first

    expect(items.count).to eq(3)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
  end

  it "can return a single item by id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item['id']).to eq(id)
  end
end