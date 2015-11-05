require 'rails_helper'

RSpec.describe ConstituencyType, type: :model do
  describe 'instance method' do
    let(:constituency_type) {FactoryGirl.create(:constituency_type)}
    describe '#name' do
      it 'returns the name' do
        expect(constituency_type.name).to eq("Dáil Éireann")
      end
    end

    describe '#description' do
      it 'returns the description' do
        expect(constituency_type.description).to eq("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      end
    end

    describe '#member_title_abbreviation' do
      it 'returns the member_title_abbreviation' do
        expect(constituency_type.member_title_abbreviation).to eq("TD")
      end
    end

    describe '#mapit_code' do
      it 'returns the mapit_code' do
        expect(constituency_type.mapit_code).to eq("DAI")
      end
    end
  end
end
