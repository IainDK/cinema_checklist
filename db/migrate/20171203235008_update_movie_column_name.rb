class UpdateMovieColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :movies, :movie_title, :title
  end
end
