class Post < ApplicationRecord
  attr_accessor :category

  belongs_to :user
  belongs_to :toi

  validates :rating, :photo, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
