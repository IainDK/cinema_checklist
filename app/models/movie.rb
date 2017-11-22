class Movie < ApplicationRecord
  validates :movie_title, presence: true
  validates :watch_date, presence: true,
                         format: { with: is_a?(Date) }
  validates :cinema, presence: true,
                     length: { minimum: 3 }
  validate :valid_imdb_link

  def valid_imdb_link
    unless imdb_link[0...2] == "tt" && imdb_link.length == 9
      errors.add(:imdb_link, "Please submit a valid IMDb link.")
    end
  end
end
