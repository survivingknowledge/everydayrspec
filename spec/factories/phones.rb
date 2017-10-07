FactoryGirl.define do
  factory :phone do
    association :contract
    phone '123-555-1234'
    phone_type 'home'
  end
end
