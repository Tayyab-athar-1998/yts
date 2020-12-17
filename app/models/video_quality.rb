class VideoQuality < ApplicationRecord
  has_and_belongs_to_many :movie

  validates :resolution, presence: true, uniqueness: true
end
