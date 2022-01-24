class ClosesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_recode, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
  end

  def create
    if Close.create(user_id: current_user.id, spot_id: @spot.id)
      redirect_to root_path
    end
  end
  
  private

  def get_recode
    @spot = Spot.find(params[:spot_id])
  end

  def move_to_index
    if @spot.order.present? || @spot.close.present?
      redirect_to root_path
    end
  end
end
