require 'rails_helper'

RSpec.describe Constituency, type: :model do
  describe 'instance method' do
    let(:constituency) {FactoryGirl.create(:constituency)}
    describe '#name' do
      it 'returns the name' do
        expect(constituency.name).to eq("Dublin")
      end
    end

    describe '#map_it_id' do
      it 'returns the map_it_id' do
        expect(constituency.map_it_id).to eq(42)
      end
    end
  end
end
