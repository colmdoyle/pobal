require 'rails_helper'

RSpec.describe Body, type: :model do
  describe 'instance method' do
    let(:body) {FactoryGirl.create(:body)}
    describe '#name' do
      it 'returns the name' do
        expect(body.name).to eq("31st Dáil")
      end

      it 'returns the id' do
        expect(body.id).to eq(1)
      end
    end
  end
end
