module Tradeable
  extend ActiveSupport::Concern

  POINTS_BY_ITEMS = { ammo: 1, medicine: 2, food: 3, water: 4 }.freeze

  def trade_items
    @user_one_items = Item.where(id: params[:user_one][:items])
    @user_two_items = Item.where(id: params[:user_two][:items])

    calculate_items_points

    swap_items if @user_one_points == @user_two_points
  end

  def calculate_items_points
    @user_one_points = @user_one_items.collect { |item| POINTS_BY_ITEMS[item.name.to_sym] }.sum
    @user_two_points = @user_two_items.collect { |item| POINTS_BY_ITEMS[item.name.to_sym] }.sum
  end

  def swap_items
    @user_one_items.update_all(user_id: @user_two.id)
    @user_two_items.update_all(user_id: @user_one.id)
  end

  def check_infected_user
    render json: { errors: 'User infected. Cannot complete the action' }, status: :forbidden if @user && @user.infected?
  end
end
