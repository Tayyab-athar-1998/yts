class Review < Feedback
  validates_uniqueness_of :movie_id, scope: :user_id, message: 'user should have only one review on a movie'
end
