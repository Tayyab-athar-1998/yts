class Actor < ApplicationRecord
  has_many :movie_roles, dependent: :destroy
  has_many :movies, through: :movie_roles

  has_one :image, as: :imageable
end
