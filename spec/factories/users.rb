FactoryGirl.define do
  factory :user do
    email
    name      FFaker::Name.first_name
    password  FFaker::Internet.password(8)
    admin     false

    factory :admin do
      admin true
    end
  end

  sequence :email do |n|
    "#{n}#{FFaker::Internet.email}"
  end
end
