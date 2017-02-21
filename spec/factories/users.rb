FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Faker::Lorem.word }
    latitude { Faker::Number.decimal(2, 6) }
    longitude { Faker::Number.decimal(2, 6) }
  end
end
