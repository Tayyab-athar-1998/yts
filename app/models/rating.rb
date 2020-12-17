class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :value, presence: true
  validate ->(object) { errors.add(:value, "rating can't be negative.") if object.value < 0.0 }
end
