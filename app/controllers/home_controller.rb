class HomeController < ApplicationController

  NUMBER_OF_POPULAR_MOVIES = 4
  NUMBER_OF_LATEST_MOVIES = 8

  def index
    @popular_movies = Movie.most_downloaded.take(NUMBER_OF_POPULAR_MOVIES)
    @latest_movies = Movie.latest_movies.take(NUMBER_OF_LATEST_MOVIES)
  end
end
