class AddYearOfReleaseToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :year_of_release, :integer
  end
end
