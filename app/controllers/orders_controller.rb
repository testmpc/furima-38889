class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @order_address = DonationAddress.new
  end

  def create
    @order_address = DonationAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(post_code: post_code, prefecture_id: prefecture_id,municipality: municipality,
                                          block_number: block_number,building: building,
                                          tel_number: tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end