FactoryGirl.define do
  factory :infection_alert do
    infected_user_id { create(:user).id }
    reporter_user_id { create(:user).id }
  end

  factory :invalid_infection_alert, parent: :infection_alert do
    infected_user_id nil
    reporter_user_id nil
  end
end
