class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @toi = @post.tois.build
  end

  def create
    @post = Post.find_or_initialize_by(post_params)
    if @post.new_record?
      @toi = Toi.create(toi_params)
      post.tois << @toi
    else
      @toi = Toi.find_or_create_by(toi_params)
      post.tois << @toi unless @post.tois.include?(@toi)
    end

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:photo, :review, :rating, :user_id, :toi_id)
  end

  def toi_params
    params.require(:toi).permit(:title, :category_id, :location, :description, :trailer)
  end
end
