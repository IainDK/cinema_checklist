class Movie < ApplicationRecord
  validates :movie_title, presence: true
  validates :watch_date, presence: true,
                         format: { with: is_a?(Date) }
  validates :cinema, presence: true,
                     length: { minimum: 3 }
  validates :imdb_link, presence: true
end
