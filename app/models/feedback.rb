class Feedback < ApplicationRecord
  belongs_to :movie, counter_cache: true
  belongs_to :user

  validates :content, presence: true
end
