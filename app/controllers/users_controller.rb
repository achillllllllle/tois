class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
  end

  def update
    current_user.update(permitted: false)
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
