FactoryGirl.define do
  factory :recipe do
    name
    kitchen
    food_type
    preference
    serves        '5'
    time          '60'
    difficulty    'Easy'
    ingredients   FFaker::Lorem.paragraph(2)
    steps         FFaker::Lorem.paragraph(2)
    favorite      '10'
    user
  end

  sequence :name do |n|
    "Recipe #{n} #{FFaker::Name.name}"
  end
end
