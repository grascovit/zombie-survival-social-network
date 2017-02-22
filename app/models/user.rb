class User < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :items, inverse_of: :user, dependent: :destroy
  has_many :reported_infection_alerts, class_name: 'InfectionAlert', foreign_key: 'reporter_user_id'
  has_many :received_infection_alerts, class_name: 'InfectionAlert', foreign_key: 'infected_user_id'

  accepts_nested_attributes_for :items

  def infected?
    self.received_infection_alerts.uniq(&:reporter_user_id).size >= 3
  end
end
