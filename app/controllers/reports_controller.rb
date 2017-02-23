class ReportsController < ApplicationController
  include Reportable

  before_action :set_all_users_count
  before_action :set_infected_users_count, only: [:infected_users]
  before_action :set_uninfected_users_count, only: [:uninfected_users]

  def infected_users
    render json: { data: "#{infected_users_percentage}% of the users are infected" }, status: :ok
  end

  def uninfected_users
    render json: { data: "#{uninfected_users_percentage}% of the users are not infected" }, status: :ok
  end

  def average_items_per_user
    render json: { data: average_items }, status: :ok
  end

  def points_lost
    render json: { data: lost_points_by_infected }, status: :ok
  end

  private

  def set_all_users_count
    @all_users_count = User.count.to_f
  end

  def set_infected_users_count
    @infected_users_count = User.infected_users.length.to_f
  end

  def set_uninfected_users_count
    @uninfected_users_count = User.uninfected_users.length.to_f
  end
end
