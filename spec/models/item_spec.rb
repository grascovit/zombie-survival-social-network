require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :name }

  it { should validate_inclusion_of(:name).in_array(Item::VALID_ITEMS) }

  it { should belong_to(:user).inverse_of(:items) }
end
