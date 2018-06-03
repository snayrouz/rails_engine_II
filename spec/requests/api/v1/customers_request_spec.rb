require 'rails_helper'

RSpec.describe "Customers API" do
  it "can return a list of all customers" do
    create_list(:customer, 3)

    get "/api/v1/customers"

    expect(response).to be_success

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(customers.count).to eq(3)
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
  end

  it "can return a single customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer['id']).to eq(id)
  end
end