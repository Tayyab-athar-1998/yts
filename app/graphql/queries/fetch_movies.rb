module Queries
  class FetchMovies < Queries::BaseQuery

    type [Types::MovieType], null: false

    def resolve
      Movie.all.order(created_at: :desc)
    end
  end
end

