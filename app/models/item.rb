class Item < ApplicationRecord
  VALID_ITEMS = { water: 4, food: 3, medicine: 2, ammo: 1 }.stringify_keys.freeze

  validates :name, presence: true
  validates :name, inclusion: { in: VALID_ITEMS.keys }

  belongs_to :user, inverse_of: :items

  scope :water_amount, -> {
    select('items.*')
      .joins('LEFT JOIN infection_alerts ON infection_alerts.infected_user_id = items.user_id')
      .where(name: 'water')
      .group('items.id, infection_alerts.infected_user_id')
      .having('COUNT(infection_alerts.reporter_user_id) < 3')
      .length
      .to_f
  }

  scope :food_amount, -> {
    select('items.*')
      .joins('LEFT JOIN infection_alerts ON infection_alerts.infected_user_id = items.user_id')
      .where(name: 'food')
      .group('items.id, infection_alerts.infected_user_id')
      .having('COUNT(infection_alerts.reporter_user_id) < 3')
      .length
      .to_f
  }

  scope :medicine_amount, -> {
    select('items.*')
      .joins('LEFT JOIN infection_alerts ON infection_alerts.infected_user_id = items.user_id')
      .where(name: 'medicine')
      .group('items.id, infection_alerts.infected_user_id')
      .having('COUNT(infection_alerts.reporter_user_id) < 3')
      .length
      .to_f
  }

  scope :ammo_amount, -> {
    select('items.*')
      .joins('LEFT JOIN infection_alerts ON infection_alerts.infected_user_id = items.user_id')
      .group('items.id, infection_alerts.infected_user_id')
      .having('COUNT(infection_alerts.reporter_user_id) < 3')
      .where(name: 'ammo')
      .length
      .to_f
  }
end
