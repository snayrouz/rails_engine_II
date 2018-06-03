require 'rails_helper'

RSpec.describe "Transactions API" do
  it "can return a list of all transactions" do
    create_list(:transaction, 3)

    get "/api/v1/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(transactions.count).to eq(3)
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("credit_card_expiration_date")
    expect(transaction).to have_key("success")
  end
end