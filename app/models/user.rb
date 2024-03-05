class User < ApplicationRecord
  has_many :followers, class_name: "Friend", foreign_key: "follower_id"
  has_many :followings, class_name: "Friend", foreign_key: "following_id"
  has_many :bookmarks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :email, :username, uniqueness: true
  validates :email, :username, presence: true
end
