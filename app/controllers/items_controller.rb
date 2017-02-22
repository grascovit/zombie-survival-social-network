class ItemsController < ApplicationController
  include Tradeable

  before_action :set_item, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_users, only: [:trade]

  # GET /items
  def index
    @items = Item.where(user_id: params[:user_id])

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = @user.items.build(item_params)

    if @user && @user.infected?
      render json: { errors: 'User infected. Cannot create a new item' }, status: :forbidden
    elsif @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @user && @user.infected?
      render json: { errors: 'User infected. Cannot update the item' }, status: :forbidden
    elsif @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    if @user && @user.infected?
      render json: { errors: 'User infected. Cannot delete the item' }, status: :forbidden
    else
      @item.destroy
    end
  end

  # PATCH/PUT /items
  def trade
    if @user_one.infected? || @user_two.infected?
      render json: { errors: 'User infected. Cannot trade the item(s)' }, status: :forbidden
    elsif trade_items
      render json: [@user_one_items, @user_two_items], status: :ok
    else
      render json: { errors: 'The items are not worth the same amount of points' }, status: :forbidden
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_users
    @user_one = User.find(params[:user_one][:id])
    @user_two = User.find(params[:user_two][:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
