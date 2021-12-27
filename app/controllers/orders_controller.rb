class OrdersController < ApplicationController
  def index
    @spot= Spot.find(params[:spot_id])
    @order= Order.new
  end
end
