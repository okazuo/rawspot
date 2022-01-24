class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @favorite_list = Spot.where(id: (Favorite.where(user_id: current_user.id).pluck(:spot_id))).includes(:close, :user, :order).with_attached_images.order(created_at: :DESC)
    @my_spots = Spot.where(user_id: current_user.id).includes(:close, :user, :order).with_attached_images.order(created_at: :DESC)
  end
end
