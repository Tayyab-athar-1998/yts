class VideoQuality < ApplicationRecord
  has_and_belongs_to_many :movie

  validates :resolution, presence: true, inclusion: {
    in: %w[720p 1080p 4K],
    message: '%<value> is not a allowed resolution.'
  }
end
