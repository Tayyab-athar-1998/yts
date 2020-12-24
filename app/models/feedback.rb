class Feedback < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :content, presence: true
  scope :comments, -> { where(type: 'Comment') }
  scope :reviews, -> { where(type: 'Review') }
end
