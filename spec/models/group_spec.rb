require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'instance method' do
    let(:group) {FactoryGirl.create(:group)}
    describe '#name' do
      it 'returns the name' do
        expect(group.name).to eq("Rebel Alliance")
      end
    end

    describe '#description' do
      it 'returns the description' do
        expect(group.description).to eq("Luke, Han, Leia and the gang")
      end
    end

    describe '#member_title_abbreviation' do
      it 'returns the member_title_abbreviation' do
        expect(group.website).to eq("http://starwars.com")
      end
    end
  end
end
