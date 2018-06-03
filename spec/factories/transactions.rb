FactoryBot.define do
  factory :transaction do
    credit_card_number "MyString"
    credit_card_expiration_date "2018-06-02"
    result "MyString"
    invoice nil
  end
end
