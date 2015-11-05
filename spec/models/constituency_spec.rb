require 'rails_helper'

RSpec.describe Constituency, type: :model do
  describe 'instance method' do
    let(:constituency) {FactoryGirl.create(:constituency)}
    describe '#name' do
      it 'returns the name' do
        expect(constituency.name).to eq("Dublin")
      end
    end

    describe '#MapItID' do
      it 'returns the MapItID' do
        expect(constituency.MapItID).to eq(42)
      end
    end
  end
end
