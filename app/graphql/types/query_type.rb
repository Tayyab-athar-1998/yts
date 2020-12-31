module Types
  class QueryType < Types::BaseObject
    field :movies, resolver: Queries::FetchMovies, description: 'All movies'
    field :movie, resolver: Queries::FetchMovie, description: 'One movie'
  end
end
