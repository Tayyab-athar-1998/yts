class Movie < ApplicationRecord

  has_and_belongs_to_many :genre
  has_and_belongs_to_many :language
  has_and_belongs_to_many :video_quality

end
