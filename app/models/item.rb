class Item < ApplicationRecord
  VALID_ITEMS = %w(water food medicine ammo).freeze

  validates_presence_of :name
  validates_inclusion_of :name, in: VALID_ITEMS

  belongs_to :user
end
