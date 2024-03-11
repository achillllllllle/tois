class UsersController < ApplicationController
  before_action :set_user, only: %i[show read_notifications]

  def show
  end

  def update
    current_user.update(permitted: false)
    redirect_to root_path
  end

  def read_notifications
    respond_to do |format|
      current_user.notifications.update_all(read: true)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
