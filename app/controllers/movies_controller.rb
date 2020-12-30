class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def render404
    render template: 'errors/error_404', status: 404
  end

  # GET /movies
  # GET /movies.json
  def index
    year = params[:year_of_release][0].split('-') unless params[:year_of_release].nil?
    starting_year = year[0] unless year.nil? || year.empty?
    ending_year = year[year.length - 1] unless year.nil? || year.empty?
    language = params[:language][0] unless params[:language].nil?
    quality = params[:quality][0] unless params[:quality].nil?
    genre = params[:genre][0] unless params[:genre].nil?
    rating = params[:rating][0] unless params[:rating].nil?
    order_by = params[:order_by][0] unless params[:order_by].nil?
    @movies = Movie.includes(:cover_photo).search_on_title(params[:title]).search_on_language(language).search_on_starting_year(
      starting_year
    ).search_on_ending_year(ending_year).search_on_video_quality(quality).search_on_genre(
      genre
    ).search_on_rating(rating).order_on_filter(order_by)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.includes(
      :cover_photo, :created_by, movie_roles: [:actor], feedback: [:user]
    ).left_outer_joins(:ratings).select(
      'movies.*, CAST(AVG(ratings.value) AS DECIMAL(10,2)) AS rating'
    ).find params[:id]
    @reviews = @movie.feedback.select { |item| item.type == 'Review' }
    @comments = @movie.feedback.select { |item| item.type == 'Comment' }
    comment_ids = @comments.map(&:id)
    @number_of_likes_on_comments = Comment.where_by_ids(comment_ids).calculate_number_of_likes
    @directors = @movie.movie_roles.select { |role| role.role_played == 'director' }
    @actors = @movie.movie_roles.select { |role| role.role_played == 'actor' }
    if current_user
      @liked_by_current_user = !(Like.movie_liked_by_current_user(params[:id],current_user.id).empty?)
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movie.build_cover_photo
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    allowed_params = movie_params
    allowed_params[:genres] = [allowed_params[:genres]]
    allowed_params[:video_quality] = [allowed_params[:video_quality]]
    @movie = Movie.new(allowed_params)
    @movie.created_by = current_user

    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.fetch(:movie, {}).permit(
      :name, :release_date, :synopsis, :video_quality, :languages, :genres, cover_photo_attributes: [:path]
    )
  end
end

# for only merging in the soft reset branch
