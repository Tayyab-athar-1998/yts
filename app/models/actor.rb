class Actor < ApplicationRecord
  has_many :movie_roles
  has_many :movies, through: :movie_roles

  has_one :image, as: :imageable

  validates :name, presence: true
end
