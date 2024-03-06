class PagesController < ApplicationController

  def home
  end

  def my_feed
    @user = current_user
    # Friend.create(follower: current_user, following: User.find(2))
    # Friend.create(follower: current_user, following: User.find(3))
    # Friend.create(follower: current_user, following: User.find(9))
    # Friend.create(follower: current_user, following: User.find(7))

    @friends = Friend.where(follower_id: @user.id).pluck(:following_id).uniq!
    @posts = Post.where(user_id: @friends).order(created_at: :desc)
    @tois = @posts.map { |post| post.toi }.uniq
  end
end
