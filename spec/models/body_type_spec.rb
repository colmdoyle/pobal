require 'rails_helper'

RSpec.describe BodyType, type: :model do
  describe 'instance method' do
    let(:body_type) {FactoryGirl.create(:body_type)}
    describe '#name' do
      it 'returns the name' do
        expect(body_type.name).to eq("Dáil Éireann")
      end
    end
  end
end
