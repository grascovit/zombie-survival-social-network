FactoryGirl.define do
  factory :item do
    name { 'water' }
    user_id { create(:user).id }
  end

  factory :invalid_item, parent: :item do
    name { 'random' }
    user_id { create(:user).id }
  end
end
