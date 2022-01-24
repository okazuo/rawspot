class SpotsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_recode, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
  def index
    @spots = Spot.order('created_at DESC').includes(:close, :user, :order).with_attached_images
  end

  def new
    @spot = Spot.new
    @spot.latitude = 35.6458437
    @spot.longitude = 139.7046171
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
    @comment = Comment.new
    @comments = @spot.comments.includes(:user)
  end
  
  def edit
  end
  
  def update
    if @spot.update(spot_params)
      redirect_to spot_path(params[:id])
    else
      render :edit
    end
  end
  
  def destroy
    @spot.destroy
    redirect_to root_path
  end

  def search
    if params[:q]&.dig(:address)
      squished_keywords = params[:q][:address].squish
      params[:q][:address_cont_any] = squished_keywords.split(' ')
    end
    @q = Spot.ransack(params[:q])
    @search_spots = @q.result.order("created_at DESC")
    render :index
  end

  def detail
    @q = Spot.ransack(params[:q])
    @spots = @q.result.order("created_at DESC").includes(:order)
  end

  private
  def spot_params
    params.require(:spot).permit(:price, :estate_agent, :size, :address, :water_id, :officialmap_id, :transcript_id, :explanation, :contact_id, :latitude, :longitude, :faxdate,  {images: []}).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @spot.user.id
      redirect_to root_path
    end 
    if @spot.order.present? || @spot.close.present?
      redirect_to root_path
    end
  end

  def get_recode
    @spot= Spot.find(params[:id])
  end
end
