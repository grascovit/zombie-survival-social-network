class Item < ApplicationRecord
  VALID_ITEMS = %w(water food medicine ammo).freeze

  validates :name, presence: true
  validates :name, inclusion: { in: VALID_ITEMS }

  belongs_to :user
end
