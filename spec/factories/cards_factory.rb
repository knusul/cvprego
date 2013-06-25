FactoryGirl.define do
  factory :contact_type do
    name "Johny"
    number "5433424343"
    association :card
  end
end
