class Post < ApplicationRecord
  attr_accessor :category

  belongs_to :user
  belongs_to :toi

  has_one_attached :photo

  has_many :notifications, dependent: :destroy

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  accepts_nested_attributes_for :toi

  after_create :notify_post

  def starify(rating)
    stars = ''
    full_stars = rating / 2

    half_star = rating % 2
    full_stars.to_i.times do
      stars += "<i class='fa-solid fa-star'></i>"

    end
    half_star.to_i.times do
      stars += "<i class='fa-solid fa-star-half-stroke'></i>"
    end
    (((10-rating)-(10-rating)%2)/2).times do
      stars += "<i class='fa-regular fa-star'></i>"
    end
    stars
  end

  private

  def notify_post
    user.following_users.each do |friend|
      next if friend == user

      notif = friend.notifications.create(post: self)
      NotificationChannel.broadcast_to(
        friend,
        ApplicationController.new.render_to_string(partial: "shared/post_notification", locals: { post: notif.post })
      )
    end
  end
end
