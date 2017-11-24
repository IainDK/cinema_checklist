class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
   @movie = Movie.new
 end

 def create
   @movie = Movie.new(movie_params)
   redirect_to movies_path if @movie.save
 end

 private

 def movie_params
   params.require(:movie).permit(:movie_title, :watch_date, :cinema, :imdb_link)
 end
end
