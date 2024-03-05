class Category < ApplicationRecord
  has_many :tois

  validates :name, inclusion: { in: %w[Cinema Spectacle Litterature Exposition] }
end
