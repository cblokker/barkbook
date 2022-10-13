class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.js
        format.json { render json: @like, status: :created, location: @like }
      end
    end
  end

  private

  def like_params
    params.permit(:dog_id)
  end
end
