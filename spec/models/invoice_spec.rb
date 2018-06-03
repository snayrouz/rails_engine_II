require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "relationships" do
    it {should belong_to :merchant}
    it {should belong_to :customer}
  end

  context "validations" do
    describe 'ensures status presence' do
      it { should validate_presence_of(:status) }
    end
  end
end

