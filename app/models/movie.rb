class Movie < ApplicationRecord
  has_one :cover_photo, class_name: :Image, as: :imageable, dependent: :destroy

  has_many :ratings, dependent: :destroy
  has_many :feedback, dependent: :destroy
  has_many :movie_roles, dependent: :destroy
  has_many :attached_images, class_name: :Image, as: :imageable, dependent: :destroy
  has_many :likes, class_name: :Like, as: :likeable, dependent: :destroy

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  validates :name, presence: true
  validates :release_date, presence: true
  validate :release_date_is_date
  validates :synopsis, presence: true
  validates :languages, presence: true, inclusion: {
    in: %w[english English Hindi hindi],
    message: '%<value> is not a allowed language'
  }

  scope :order_by_number_of_downloads, -> { order(number_of_downloads: :desc) }
  scope :latest_movies, -> { order(release_date: :desc) }
  scope :search_on_language, ->(language) { where(languages: language) unless language.nil? || language.empty? }
  scope :search_on_genre, ->(genre) { where('genres LIKE ?', "%#{genre}%") unless genre.nil? || genre.empty? }
  scope :search_on_starting_year, ->(year_of_release) { where('YEAR(release_date) >= ?', year_of_release) unless year_of_release.nil? || year_of_release.empty?}
  scope :search_on_ending_year, ->(year_of_release) { where('YEAR(release_date) <= ?', year_of_release) unless year_of_release.nil? || year_of_release.empty?}
  scope :search_on_video_quality, ->(video_quality) { where('video_quality LIKE ?', "%#{video_quality}%") unless video_quality.nil? || video_quality.empty?}
  scope :search_on_title, ->(title) { where('name LIKE ?', "%#{title}%") unless title.nil? || title.empty? }

  scope :search_on_rating, ->(minimum_rating) { left_outer_joins(:ratings).group('id').having('AVG(ratings.value) > ?', minimum_rating) unless minimum_rating.nil? || minimum_rating.empty?}
  scope :order_on_filter, ->(column_with_order) { left_outer_joins(:ratings, :likes).group('id').order(column_with_order) unless column_with_order.nil? || column_with_order.empty?}

  serialize :video_quality
  serialize :genres

  private

  def release_date_is_date
    errors.add(:release_date, 'must be a valid date') unless release_date.is_a?(Date)
  end
end
