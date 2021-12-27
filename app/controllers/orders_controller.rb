class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_recode, only: [:index, :create]

  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
    render 'index'
    end
  end

  private

  def get_recode
    @spot = Spot.find(params[:spot_id])
  end

  def order_params
    params.require(:order).permit(:customer, :not_tradeable,).merge(user_id: current_user.id, spot_id: @spot.id)
  end
end
