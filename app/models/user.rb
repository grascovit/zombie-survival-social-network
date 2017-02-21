class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :latitude
  validates_presence_of :longitude

  has_many :items
end
