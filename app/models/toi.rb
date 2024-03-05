class Toi < ApplicationRecord
  belongs_to :category
  has_many :posts
  has_many :bookmarks
  has_many :toi_artists
  has_many :artists, through: :toi_artists

  validates :title, :category, :artists, :description, presence: true
  validates :trailer, presence: true, if: :cinema?
  validates :location, presence: true, if: :spectacle?
  validates :location, presence: true, if: :exposition?

  def cinema?
    this.category == "Cinema"
  end

  def spectacle?
    this.category == "Spectacle"
  end

  def exposition?
    this.category == "Exposition"
  end
end
