module Mutations
  class UpdateMovie < Mutations::BaseMutation
    argument :params, Types::Input::MovieInputType, required: true
    argument :id, Int, required: true

    field :is_successful, Boolean, null: false

    # implement check if user belongs to current logged in user after implementing auth
    def resolve(params:, id:)
      movie = Movie.find id
      {is_successful: movie.update(params.to_h)}
    end
  end
end
