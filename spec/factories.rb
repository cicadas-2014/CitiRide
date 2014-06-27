FactoryGirl.define do
  factory :ride do
    starting_point { Faker::Address.street_address }
    destination { Faker::Address.street_address }
  end

  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    ride
  end
end
