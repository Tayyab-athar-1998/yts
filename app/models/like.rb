class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :user

  scope :movie_liked_by_current_user, ->(movie_id, user_id) { where("likeable_id = :likeable_id AND likeable_type = 'Movie' AND user_id = :user_id", {likeable_id:movie_id, user_id:user_id }) }
end
