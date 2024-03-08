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
    @toi = Toi.find_or_initialize_by(title: toi_params[:title]) if toi_params
    if @toi.nil?
      flash[:alert] = "Infos manquantes..."
      render :new, status: :unprocessable_entity and return
    end

    if @toi.new_record?
      raise
      if @toi.update(toi_params) && @toi.save
        @post.toi = @toi
      else
        flash[:alert] = "Infos manquantes..."
        render :new, status: :unprocessable_entity and return
      end
    else
      @post.toi = @toi
    end

    if @post.save!
      @post.rating = @post.rating * 2
      @post.save
      current_user.permitted = true
      redirect_to toi_path(@post.toi), notice: 'Ton post a bien été créé'
    else
      flash[:alert] = "Infos manquantes..."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def toi_params
    return unless params.dig(:post, :toi_attributes)

    params[:post][:toi_attributes].permit!.to_h.merge({ title: params[:post][:toi] })
  end

  def post_params
    allowed_params = [:photo, :review, :rating, :user_id, :toi_id]
    if params[:post].present? && params[:post].is_a?(Hash)
      allowed_params << :additional_field if params[:post][:additional_field].present?
    end
    params.require(:post).permit(allowed_params)
  end
end
