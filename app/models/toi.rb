class Toi < ApplicationRecord
  belongs_to :category
  has_many :posts
  has_many :bookmarks
  has_many :toi_artists, dependent: :destroy
  has_many :artists, through: :toi_artists
  has_one_attached :photo

  validates :title, :category, :description, presence: true
  validates :trailer, presence: true, if: :cinema?
  validates :location, presence: true, if: :spectacle?
  validates :location, presence: true, if: :exposition?

  def cinema?
    self.category == "Cinema"
  end

  def spectacle?
    self.category == "Spectacle"
  end

  def exposition?
    self.category == "Exposition"
  end

  def followed_users_posts(user)
    posts.where(user_id: user.followed_users.pluck(:id))
  end
end
