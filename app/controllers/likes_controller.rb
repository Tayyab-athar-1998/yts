class LikeController < ApplicationController
  before_action :authenticate_user!

  def index
    likeable_type = params[:likeable_type]
    likeable_id = params[:likeable_id]
    like = Like.where(
      'likeable_id = :likeable_id AND likeable_type = :likeable_type AND user_id = :user_id',
      { likeable_id: likeable_id, likeable_type: likeable_type, user_id: current_user.id }
    )
    if like.empty?
      Like.create(likeable_id: likeable_id, likeable_type: likeable_type, user_id: current_user.id)
    else
      like[0].destroy
    end
  end
end
