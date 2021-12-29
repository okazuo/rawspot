class ClosesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_recode, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @close = Close.new
  end

  def create
    @close = Close.new(close_params)
    @close.not_available = 1
    @close.save
    redirect_to root_path
  end

  
  private

  def get_recode
    @spot = Spot.find(params[:spot_id])
  end

  def close_params
    params.require(:close).permit(:not_available).merge(user_id: current_user.id, spot_id: @spot.id)
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
