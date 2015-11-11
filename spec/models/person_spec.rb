require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'instance methods' do
    let(:person) {FactoryGirl.create(:person)}
    it 'returns the full name' do
      expect(person.name).to eq("#{person.first_name} #{person.last_name}")
    end

    it 'returns the first name' do
      expect(person.first_name).to eq("Jane")
    end

    it 'returns the last name' do
      expect(person.last_name).to eq("Bloggs")
    end

    it 'returns the phone number' do
      expect(person.phone_number).to eq("+353871234567")
    end

    it 'returns the email' do
      expect(person.email).to eq("foo@bar.com")
    end

    it 'returns the website url' do
      expect(person.website).to eq("http://www.google.com")
    end

    it 'returns the facebook username/id' do
      expect(person.facebook).to eq("4")
    end

    it 'returns the facebook vanity' do
      expect(person.facebook_url).to eq("https://fb.me/4")
    end

    it 'returns the twitter username' do
      expect(person.twitter).to eq("jane_bloggs_tweets")
    end

    it 'returns the twitter vanity' do
      expect(person.twitter_url).to eq("https://twitter.com/jane_bloggs_tweets")
    end

    it 'returns the postal address' do
      expect(person.postal_address).to eq("Kildare St, Dublin 2, Ireland")
    end

    it 'returns the gender' do
      expect(person.gender).to eq("Female")
    end

    it 'returns the current party'
  end
end
