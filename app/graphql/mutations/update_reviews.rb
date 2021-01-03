module Mutations
  class UpdateReview < Mutations::BaseMutation
    argument :content, String, required: true
    argument :movie_id, Int, required: true

    field :is_successful, Boolean, null: false

    def resolve(content:, movie_id:)
      current_user = User.find 1

      review = Review.first_or_initialize(movie_id: movie_id, user: current_user) 
      result = review.update_attributes(content: content)
      { is_successful: result }
    end
  end
end
