class SpotsController < ApplicationController
  before_action :authenticate_user!, except: :index

  
  def index
    @spots = Spot.order('created_at DESC')
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

  def show
    @spot = Spot.find(params[:id])
  end

  def search
    if params[:q]&.dig(:address)
      squished_keywords = params[:q][:address].squish
      params[:q][:address_cont_any] = squished_keywords.split(' ')
    end
    @q = Spot.ransack(params[:q])
    @spots = @q.result.order("created_at DESC")
  end

  private
  def spot_params
    params.require(:spot).permit(:price, :estate_agent, :size, :address, :water_id, :officialmap_id, :transcript_id, :explanation, :contact_id, :image).merge(user_id: current_user.id)
  end
end
