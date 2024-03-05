class Category < ApplicationRecord
  has_many :tois, dependent: :destroy
end
