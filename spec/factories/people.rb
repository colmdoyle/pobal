FactoryGirl.define do
  factory :person do
    first_name 'Jane'
    last_name 'Bloggs'
    phone_number '+353871234567'
    email 'foo@bar.com'
    website 'http://www.google.com'
    facebook '4'
    twitter 'jane_bloggs_tweets'
    postal_address 'Kildare St, Dublin 2, Ireland'
    gender 'Female'
  end

end
