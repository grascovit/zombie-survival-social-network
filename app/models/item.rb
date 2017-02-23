class Item < ApplicationRecord
  VALID_ITEMS = { water: 4, food: 3, medicine: 2, ammo: 1 }.stringify_keys.freeze

  validates :name, presence: true
  validates :name, inclusion: { in: VALID_ITEMS.keys }

  belongs_to :user, inverse_of: :items

  def self.water_amount
    Item.where(name: 'water', user_id: User.uninfected_users_ids).count.to_f
  end

  def self.food_amount
    Item.where(name: 'food', user_id: User.uninfected_users_ids).count.to_f
  end

  def self.medicine_amount
    Item.where(name: 'medicine', user_id: User.uninfected_users_ids).count.to_f
  end

  def self.ammo_amount
    Item.where(name: 'ammo', user_id: User.uninfected_users_ids).count.to_f
  end
end
