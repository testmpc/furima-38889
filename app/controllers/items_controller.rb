class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    return if @item.user_id == current_user.id

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, locals: { item: @item }
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :shippingfee_id, :prefecture_id,
                                 :deliveryskd_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
