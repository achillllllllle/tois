class ToisController < ApplicationController
  before_action :set_toi, only: [:show]

  def index
    @tois = Toi.all
  end

  def show
    user_friends = Friend.where(follower_id: current_user.id).pluck(:following_id).uniq!
    @filtered_posts = Post.where(toi_id: @toi.id, user_id: user_friends).order(created_at: :desc)
  end

  private

  def set_toi
    @toi = Toi.find(params[:id])
  end

  def toi_params
    params.require(:toi).permit(:title, :category_id, :location, :description, :trailer)
  end
end
