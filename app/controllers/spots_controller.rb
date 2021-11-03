class SpotsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.new
  end
  
  def create
    @spot= Spot.create(spot_params)
  end

  private
  def spot_params
    params.require(:spot).permit(:price, :estate_agent, :size, :address, :water_id, :officialmap_id, :transcript_id, :explanation, :contact_id).merge(user_id: current_user.id)
  end
end
