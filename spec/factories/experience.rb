FactoryGirl.define do
  factory :experience do
    from_date "12/12/12"
    to_date "12/13/13"
    description "desc"
    role "Bravo"
  end

  factory :education do
    from_date "12/12/12"
    to_date "12/13/13"
  end
end
