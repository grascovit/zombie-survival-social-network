FactoryGirl.define do
  factory :item do
    name { Item::VALID_ITEMS.sample }
    user_id { create(:user).id }
  end

  factory :invalid_item, parent: :item do
    name { 'random' }
    user_id { create(:user).id }
  end
end
