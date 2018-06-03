require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it {should belong_to :merchant}
  end

  context "validations" do
    describe 'ensures name presence' do
      it { should validate_presence_of(:name) }
    end

    describe 'ensures description presence' do
      it { should validate_presence_of(:description) }
    end
  end
end
