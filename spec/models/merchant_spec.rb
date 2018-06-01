require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it {should have_many :items}
  end

  context "validations" do
    describe 'ensures name presence' do
      it { should validate_presence_of(:name) }
    end
  end
end
