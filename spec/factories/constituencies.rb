FactoryGirl.define do
  factory :constituency do
    name "Dublin"
    map_it_id 42
    association :constituency_type
  end

end
