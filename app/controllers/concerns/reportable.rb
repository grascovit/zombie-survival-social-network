module Reportable
  extend ActiveSupport::Concern

  def infected_users_percentage
    ((@infected_users_count / @all_users_count) * 100).round(2)
  end

  def uninfected_users_percentage
    ((@uninfected_users_count / @all_users_count) * 100).round(2)
  end

  def average_items
    water_average = (Item.water_amount / @all_users_count).round(2)
    food_average = (Item.food_amount / @all_users_count).round(2)
    medicine_average = (Item.medicine_amount / @all_users_count).round(2)
    ammo_average = (Item.ammo_amount / @all_users_count).round(2)

    { water_per_user: water_average, food_per_user: food_average,
      medicine_per_user: medicine_average, ammo_per_user: ammo_average }
  end

  def lost_points_by_infected
    { total_points_lost: User.infected_users.sum(&:total_points) }
  end
end
