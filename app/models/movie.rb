class Movie < ApplicationRecord
  serialize :video_quality
  serialize :genres

  has_one :cover_photo, class_name: :Image, as: :imageable, dependent: :destroy

  has_many :ratings, dependent: :destroy
  has_many :feedback, dependent: :destroy
  has_many :movie_roles, dependent: :destroy
  has_many :attached_images, class_name: :Image, as: :imageable, dependent: :destroy
  has_many :likes, class_name: :Like, as: :likeable, dependent: :destroy

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  validates :name, presence: true
  validates :release_date, presence: true
  validate :valid_release_date
  validates :synopsis, presence: true
  validates :languages, presence: true, inclusion: {
    in: %w[english English Hindi hindi],
    message: '%<value> is not a allowed language'
  }

  scope :most_downloaded, -> { order(number_of_downloads: :desc) }
  scope :latest_movies, -> { order(release_date: :desc) }

  private

  def valid_release_date?
    errors.add(:release_date, 'must be a valid date') unless release_date.is_a?(Date)
  end
end
