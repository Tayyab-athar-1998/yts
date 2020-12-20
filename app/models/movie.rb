class Movie < ApplicationRecord
  has_one :cover_photo, class_name: :Image, as: :imageable

  has_many :ratings
  has_many :feedback
  has_many :movie_roles
  has_many :roles, through: :movie_roles
  has_many :user, through: :feedback
  has_many :rated_by_user, through: :ratings, class_name: :User
  has_many :attached_images, class_name: :Image, as: :imageable
  has_many :likes, class_name: :Like, as: :likeable

  has_and_belongs_to_many :genre
  has_and_belongs_to_many :video_quality

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  validates :name, presence: true
  validates :release_date, presence: true
  validate :release_date_is_date
  validates :synopsis, presence: true
  validates :languages, presence: true, inclusion: {
    in: %w[english English Hindi hindi],
    message: '%<value> is not a allowed language'
  }

  private

  def release_date_is_date
    errors.add(:release_date, 'must be a valid date') unless release_date.is_a?(Date)
  end
end
