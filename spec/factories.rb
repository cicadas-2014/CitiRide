FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :ride do
    starting_point { Faker::Address.street_address }
    destination { Faker::Address.street_address }
    user
  end

end
