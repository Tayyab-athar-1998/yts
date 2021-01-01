module Types
  class QueryType < Types::BaseObject
    field :movies, resolver: Queries::FetchMovies, description: 'All movies'
    field :movie, resolver: Queries::FetchMovie, description: 'One movie'
    field :feedbacks, resolver: Queries::FetchFeedbacks, description: 'Feedbacks of a movie'
  end
end
