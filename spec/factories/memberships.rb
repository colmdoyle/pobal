FactoryGirl.define do
  factory :membership do
    start_date Date.new(1999, 12, 31)
    end_date Date.new(2000, 12, 31)
    association :person
    association :group
  end

end
