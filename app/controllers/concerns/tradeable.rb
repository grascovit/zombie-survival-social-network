module Tradeable
  extend ActiveSupport::Concern

  POINTS_BY_ITEMS = { ammo: 1, medicine: 2, food: 3, water: 4 }.freeze

  def trade_items
    @user_one_items = params[:user_one][:items].collect { |item_id| Item.find(item_id) }
    @user_two_items = params[:user_two][:items].collect { |item_id| Item.find(item_id) }

    @user_one_points = @user_one_items.collect { |item| POINTS_BY_ITEMS[item.name.to_sym] }.inject(:+)
    @user_two_points = @user_two_items.collect { |item| POINTS_BY_ITEMS[item.name.to_sym] }.inject(:+)

    swap_items if @user_one_points == @user_two_points
  end

  def swap_items
    @user_one_items.each { |item|
      item.user = @user_two
      item.save
    }

    @user_two_items.each { |item|
      item.user = @user_one
      item.save
    }
  end
end
