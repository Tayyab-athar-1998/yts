class Movie < ApplicationRecord
  has_one :cover_photo, class_name: :Image, as: :imageable

  has_many :ratings
  has_many :feedback
  has_many :movie_roles
  has_many :attached_images, class_name: :Image, as: :imageable
  has_many :likes, class_name: :Like, as: :likeable

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  serialize :video_quality
  serialize :genres
end
