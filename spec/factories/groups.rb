FactoryGirl.define do
  factory :group do
    name "Rebel Alliance"
    description "Luke, Han, Leia and the gang"
    website "http://starwars.com"
    association :group_type
  end

end
