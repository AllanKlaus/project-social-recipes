FactoryGirl.define do
  factory :kitchen do
    name  { generate(:kitchen_name) }
  end

  sequence :kitchen_name do |n|
    "Kitchen #{n} #{FFaker::Name.first_name}"
  end
end
