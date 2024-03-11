class ToisController < ApplicationController
  before_action :set_toi, only: [:show]

  def index
    @tois = Toi.all.order(created_at: :desc)



    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @tois = @tois.where(category: @category)
      

    end

    if params[:query].present?
      query = params[:query]
      @tois = @tois.where("LOWER(title) LIKE ?", "%#{query.downcase}%")
    end
  end

  def show
    @posts = @toi.followed_users_posts(current_user)
    @user = User.first

  end

  def find_toi
    toi = Toi.find_by(name: params[:name])
    render json: toi
  end

  private

  def set_toi
    @toi = Toi.find(params[:id])
  end

  def toi_params
    params.require(:toi).permit(:title, :category_id, :location, :description, :trailer, :photo)
  end
end
