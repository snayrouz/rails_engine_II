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
    expect(transaction).to have_key("result")
  end

  it "can return a single transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(id)
  end

  context "Relationship Endpoints" do
    it "returns the related invoice" do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["id"]).to eq(transaction.invoice_id)
    end
  end
end