class UsersController < ApplicationController
  before_action :set_user, only: %i[show follow unfollow]

  def show
  end

  def update
    current_user.update(permitted: false)
    redirect_to root_path

  end
  def follow
    current_user.friends.create!(following_id: @user.id)
    redirect_to user_path(@user)

  end
  def unfollow
    friend = current_user.friends.find_by!(following_id: @user.id)
    friend.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
