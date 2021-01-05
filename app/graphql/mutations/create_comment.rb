module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :content, String, required: true
    argument :movie_id, Int, required: true

    field :is_successful, Boolean, null: false

    def resolve(content:, movie_id:)
      current_user = User.find 1

      result = Comment.create(movie_id: movie_id, user: current_user, content: content) 
      { is_successful: result }
    end
  end
end
