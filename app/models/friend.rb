class Friend < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
  has_many :notifications, dependent: :destroy

  validates :follower, uniqueness: { scope: :following }

  after_create :notify_friend

  private

  def notify_friend
    friend = following
    return if friend == follower

    notif = friend.notifications.create(friend: self)
    NotificationChannel.broadcast_to(
      friend,
      ApplicationController.new.render_to_string(partial: "shared/friend_notification", locals: { user: notif.friend.follower })
    )
  end
end
