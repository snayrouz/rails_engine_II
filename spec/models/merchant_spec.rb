require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it {should have_many :items}
  end
end
