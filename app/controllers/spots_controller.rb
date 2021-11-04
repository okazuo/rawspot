class SpotsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.new
  end
  
  def create
    @spot= Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:price, :estate_agent, :size, :address, :water_id, :officialmap_id, :transcript_id, :explanation, :contact_id, :image).merge(user_id: current_user.id)
  end
end
