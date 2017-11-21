class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.date :watch_date
      t.string :cinema
      t.string :imdb_link

      t.timestamps
    end
  end
end
