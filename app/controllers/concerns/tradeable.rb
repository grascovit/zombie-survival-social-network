module Tradeable
  extend ActiveSupport::Concern

  def trade_items
    @user_one_items = Item.where(id: params[:user_one][:items])
    @user_two_items = Item.where(id: params[:user_two][:items])

    swap_items if @user_one.total_points == @user_two.total_points
  end

  def swap_items
    @user_one_items.update_all(user_id: @user_two.id)
    @user_two_items.update_all(user_id: @user_one.id)
  end

  def check_infected_user
    render json: { errors: 'User infected. Cannot complete the action' }, status: :forbidden if @user && @user.infected?
  end
end
