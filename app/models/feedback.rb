class Feedback < ApplicationRecord
  belongs_to :movie, counter_cache: true
  belongs_to :user

  validates :content, presence: true
  scope :comments, -> { where(type: 'Comment') }
  scope :reviews, -> { where(type: 'Review') }
  scope :feedback_on_movie, ->(movie_id) { joins(:movie).where(movies: { id: movie_id }) }
  scope :filter_by_type, ->(type) { where(type: type) unless type.nil? || type.empty? }
end
