module Queries
  class FetchFeedbacks < Queries::BaseQuery

    type [Types::FeedbackType], null: true
    argument :movie_id, ID, required: true
    argument :feedback_type, String, required: false

    def resolve(movie_id:, feedback_type: nil)
      Feedback.filter_by_type(feedback_type).feedback_on_movie(movie_id)
    end
  end
end
