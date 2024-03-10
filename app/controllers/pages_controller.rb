class PagesController < ApplicationController

  def home
  end

  def my_feed
    @tois = current_user.followed_users_tois
    @posts_this_week = []
    @posts_previous_weeks = []

    @tois.each do |toi|
      posts_this_week = []
      posts_previous_weeks = []

      toi.followed_users_posts(current_user).sort_by(&:created_at).reverse.each do |post|
        if post.created_at.beginning_of_week == Date.current.beginning_of_week
          posts_this_week << post
        else
          posts_previous_weeks << post
        end
      end

      unless posts_this_week.empty?
        @posts_this_week << [toi, posts_this_week]
      end

      unless posts_previous_weeks.empty?
        @posts_previous_weeks << [toi, posts_previous_weeks]
      end
    end
  end
end
