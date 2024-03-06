class ToisController < ApplicationController
  def index
    @tois = Toi.all
  end

#   def show
#     @toi = Toi.find(params[:id])
#   end

#   def new
#     @toi = Toi.new
#     @posy = @toi.posts.build
#   end

#   def create
#     @toi = Toi.find_or_initialize_by(toi_params)
#     if @toi.new_record?
#       @post = Post.create(post_params)
#       toi.posts << @post
#     else
#       @post = Post.find_or_create_by(post_params)
#       toi.posts << @post unless @toi.posts.include?(@post)
#     end

#     if @toi.save
#       redirect_to toi_path(@toi)
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   private

#   def toi_params
#     params.require(:toi).permit(:title, :category_id, :location, :description, :trailer)
#   end

#   def post_params
#     params.require(:post).permit(:photo, :review, :rating, :user_id, :toi_id)
#   end
end
