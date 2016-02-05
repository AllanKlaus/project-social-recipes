FactoryGirl.define do
  factory :recipe do
    name          "Recipe #{FFaker::Name.name}"
    kitchen
    food_type
    preference
    serves        '5'
    time          '60'
    difficulty    'Easy'
    ingredients   FFaker::Lorem.paragraph(2)
    steps         FFaker::Lorem.paragraph(2)
  end
end
