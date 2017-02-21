FactoryGirl.define do
  factory :infection_alert do
    infected_user { create(:user).id }
    reporter_user { create(:user).id }
  end
end
