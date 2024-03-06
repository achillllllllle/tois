class ToisController < ApplicationController
  before_action :set_toi, only: [:show]

  def index
    @tois = Toi.all
  end

  def show
    @posts = @toi.followed_users_posts(current_user)
  end

  private

  def set_toi
    @toi = Toi.find(params[:id])
  end

  def toi_params
    params.require(:toi).permit(:title, :category_id, :location, :description, :trailer)
  end
end
