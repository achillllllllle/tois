class PagesController < ApplicationController

  def home
  end

  def my_feed
    @tois = current_user.followed_users_tois
  end
end
