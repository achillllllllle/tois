class Artist < ApplicationRecord
  has_many :toi_artists
  has_many :tois, through: :toi_artists

  validates :name, presence: true
end
