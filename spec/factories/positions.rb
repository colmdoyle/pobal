FactoryGirl.define do
  factory :position do
    start_date Date.new(1999, 12, 31)
    end_date Date.new(2000, 12, 31)
    association :body
    association :constituency
    association :person
    association :position_type
  end

end
