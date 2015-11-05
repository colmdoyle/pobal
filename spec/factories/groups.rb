FactoryGirl.define do
  factory :group do
    name "Rebel Alliance"
    description "Luke, Han, Leia and the gang"
    homepage "http://starwars.com"
    association :group_type
  end

end
