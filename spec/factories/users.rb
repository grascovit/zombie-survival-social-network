FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Faker::Lorem.word }
    latitude { Faker::Number.decimal(2, 6) }
    longitude { Faker::Number.decimal(2, 6) }
  end

  factory :invalid_user, parent: :user do
    name nil
    age nil
    gender nil
    latitude nil
    longitude nil
  end

  factory :infected_user, parent: :user do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Faker::Lorem.word }
    latitude { Faker::Number.decimal(2, 6) }
    longitude { Faker::Number.decimal(2, 6) }
    received_infection_alerts { create_list(:infection_alert, 3) }
  end
end
