class CommentChannel < ApplicationCable::Channel
  def subscribed
    @spot = Spot.find(params[:spot_id]) 
    stream_for @spot
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
