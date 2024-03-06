class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @toi = Toi.new
    @post = Post.new(toi: @toi)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @toi = Toi.find_or_initialize_by(title: toi_params[:title])
    if @toi.new_record?
      if @toi.update(toi_params) && @toi.save
        @post.toi = @toi
      else
        render :new, status: :unprocessable_entity
        return
      end
    else
      @post.toi = @toi
    end

    if @post.save!
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def toi_params
    params[:post][:toi_attributes].permit!.to_h.merge({ title: params[:post][:toi] })
  end

  def post_params
    params.require(:post).permit(:photo, :review, :rating, :user_id, :toi_id)
  end
end
