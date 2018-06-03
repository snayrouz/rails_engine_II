require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "relationships" do
    it {should have_many :invoices}
  end

  context "validations" do
    describe 'ensures first name presence' do
      it { should validate_presence_of(:first_name) }
    end

    describe 'ensures last name presence' do
      it { should validate_presence_of(:last_name) }
    end
  end
end
