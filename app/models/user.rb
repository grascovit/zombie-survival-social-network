class User < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :items
end
