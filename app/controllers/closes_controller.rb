class ClosesController < ApplicationController
  before_action :get_recode, only: [:index, :create]

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

end
