FactoryGirl.define do
  factory :food_type do
    name  { generate(:food_name) }
  end

  sequence :food_name do |n|
    "FoodType #{n} #{FFaker::Name.name}"
  end
end
