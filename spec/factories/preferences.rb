FactoryGirl.define do
  factory :preference do
    name  { generate(:preference_name) }
  end

  sequence :preference_name do |n|
    "Preference #{n} #{FFaker::Name.name}"
  end
end
