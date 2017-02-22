class Item < ApplicationRecord
  VALID_ITEMS = { water: 4, food: 3, medicine: 2, ammo: 1 }.stringify_keys.freeze

  validates :name, presence: true
  validates :name, inclusion: { in: VALID_ITEMS.keys }

  belongs_to :user, inverse_of: :items
end
