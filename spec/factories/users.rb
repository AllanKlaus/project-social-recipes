FactoryGirl.define do
  factory :user do
    email
    name      FFaker::Name.name
    password  FFaker::Internet.password(8)
  end

  sequence :email do |n|
    "#{n}#{FFaker::Internet.email}"
  end
end
