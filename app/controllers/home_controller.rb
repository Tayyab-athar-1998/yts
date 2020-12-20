class HomeController < ApplicationController
  def index
    @movies_on_number_of_downlaods = Movie.order_by_number_of_downloads.take(4)
    @latest_movies = Movie.latest_movies.take(8)
  end
end
