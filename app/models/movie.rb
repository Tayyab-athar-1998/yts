class Movie < ApplicationRecord

  has_and_belongs_to_many :genre
  has_and_belongs_to_many :language
  has_and_belongs_to_many :video_quality

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  has_many :movie_roles
  has_many :roles, through: :movie_roles

  has_many :feedback
  has_many :user, through: :feedback

  has_many :ratings
  has_many :rated_by_user, through: :ratings, class_name: :User
end
