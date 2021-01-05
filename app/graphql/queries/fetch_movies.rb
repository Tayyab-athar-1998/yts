module Queries
  class FetchMovies < Queries::BaseQuery
    argument :search_params, Types::Input::MovieSearchType, required: false, default_value: {}

    type [Types::MovieType], null: false

    def resolve(search_params:)
      year = search_params[:year].split('-') unless search_params[:year].nil?
      starting_year = year[0] unless year.nil? || year.empty?
      ending_year = year[year.length - 1] unless year.nil? || year.empty?
      params = {
        search_on_title: search_params[:title],
        search_on_rating: search_params[:rating],
        search_on_genre: search_params[:genre],
        search_on_starting_year: starting_year,
        search_on_ending_year: ending_year,
        search_on_language: search_params[:language],
        order_on_filter: search_params[:order_by],
        search_on_video_quality: search_params[:quality]
      }
      Movie.search(params).result
    end
  end
end

