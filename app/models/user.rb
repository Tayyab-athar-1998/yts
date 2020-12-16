class User < ApplicationRecord
  has_many :movies_created, class_name: :Movie, inverse_of: 'created_by'

  has_many :feedback
  has_many :movies, through: :feedback

  has_many :ratings
  has_many :rated_movies, through: :feedback, class_name: :Movie
end
