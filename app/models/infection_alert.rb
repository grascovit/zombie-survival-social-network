class InfectionAlert < ApplicationRecord
  belongs_to :infected_user, class_name: 'User'
  belongs_to :reporter_user, class_name: 'User'
end
