require 'rails_helper'

RSpec.describe "Merchants API" do
  it "can return a list of all merchants" do
    create_list(:merchant, 10)

    get "/api/v1/merchants"

    expect(response).to be_success

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(merchants.count).to eq(10)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
  end

  it "can return a single merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant['id']).to eq(id)
  end
end