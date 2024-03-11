class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.where(saved: true).order(created_at: :desc)
    @categories = Category.joins(:tois).distinct
  end

  def create
    @toi = Toi.find(params[:toi_id])
    @bookmark = @toi.bookmarks.find_or_initialize_by(user: current_user)
    @bookmark.saved = true

    respond_to do |format|
      if @bookmark.save
        # format.html { redirect_to @toi, notice: 'Saved' }
        format.json { render json: { saved: true } }
      else
        # format.html { redirect_to @toi, alert: 'Unsaved' }
        format.json { render json: { success: false }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(toi_id: params[:toi_id])
    # @bookmark.destroy! if @bookmark

    respond_to do |format|
    #   # format.html { redirect_to toi_path, alert: 'Unsaved' }
    #   format.json { render json: { saved: false } }
      if @bookmark.destroy
        render json: { saved: false }
      else
        render json: { saved: true }, status: :unprocessable_entity
      end
    end

  end
end
