FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status "Paid"
  end
end
