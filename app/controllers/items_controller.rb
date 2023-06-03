class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, locals: { item: @item }
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :delivery_charge_id, :region_of_origin_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end