class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @spots = @user.spots

    favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id) 
    @favorite_list = Spot.find(favorites).reverse

    @my_spots = Spot.where(user_id: current_user.id).order(created_at: :DESC)
  end
end
