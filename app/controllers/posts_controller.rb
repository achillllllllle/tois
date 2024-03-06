class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @toi = Toi.find_or_initialize_by(toi_params)

    if @toi.new_record?
      if @toi.save
        @post.toi_id = @toi.id
      else
        render :new, status: :unprocessable_entity
        return
      end
    else
      @post.toi_id = @toi.id
    end

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def toi_params
    params.require(:toi).permit(:title, :category_id, :location, :description, :trailer)
  end

  def post_params
    params.require(:post).permit(:photo, :review, :rating, :user_id, :toi_id)
  end

end
