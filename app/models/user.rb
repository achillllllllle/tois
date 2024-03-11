class User < ApplicationRecord
  has_many :friends, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, -> { distinct }, through: :friends, source: :following
  # has_many :followers, class_name: "Friend", foreign_key: "follower_id"
  # has_many :followed_users, though: :followers, source: :following
  has_many :followings, class_name: "Friend", foreign_key: "following_id"
  has_many :following_users, -> { distinct }, through: :followings, source: :follower
  has_many :bookmarks
  has_one_attached :photo
  has_many :notifications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

  has_many :posts, dependent: :destroy
  validates :email, :username, uniqueness: true
  validates :email, :username, presence: true

  def followed_users_tois
    Toi.joins(:posts).where(posts: { user_id: followed_users.pluck(:id) }).distinct
  end
end
