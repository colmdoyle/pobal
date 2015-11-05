FactoryGirl.define do
  factory :constituency do
    name "Dublin"
    MapItID 42
    association :constituency_type
  end

end
