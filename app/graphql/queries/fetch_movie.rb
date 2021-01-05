module Queries
  class FetchMovie < Queries::BaseQuery

    type Types::MovieType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Movie.includes(
        :cover_photo, :created_by
      ).left_outer_joins(:ratings).select(
        'movies.*, CAST(AVG(ratings.value) AS DECIMAL(10,2)) AS rating'
      ).find id
    end
  end
end
