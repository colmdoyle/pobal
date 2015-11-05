require 'rails_helper'

RSpec.describe GroupType, type: :model do
  describe 'instance method' do
    let(:group_type) {FactoryGirl.create(:group_type)}
    describe '#name' do
      it 'returns the name' do
        expect(group_type.name).to eq("Political Party")
      end
    end
  end
end
