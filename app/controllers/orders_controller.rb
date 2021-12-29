class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_recode, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

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
    params.require(:order).permit(:customer).merge(user_id: current_user.id, spot_id: @spot.id)
  end

  def move_to_index
    unless current_user.id == @spot.user.id
      redirect_to root_path
    end 
    if @spot.order.present? || @spot.close.present?
      redirect_to root_path
    end
  end
end
