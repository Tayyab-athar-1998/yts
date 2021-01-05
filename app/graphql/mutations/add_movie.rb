module Mutations
  class AddMovie < Mutations::BaseMutation
    argument :params, Types::Input::MovieInputType, required: true

    field :movie, Types::MovieType, null: false

    def resolve(params:)
      movie_params = Hash params
      begin
        current_user = User.find 1
        movie = Movie.new(movie_params)
        movie.created_by = current_user
        movie.save
        { movie: movie }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
