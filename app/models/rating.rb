class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :value, presence: true
  validate ->(object) { errors.add(:value, "rating can't be negative.") if object.value < 0.0 }
  validates_uniqueness_of :movie_id, scope: :user_id, message: 'user should have only one rating on a movie'
end
