class Movie < ApplicationRecord

  validates :movie_title, presence: true
  validates :watch_date,  presence: true,
                          format: { with: is_a?(Date) }
  validates :cinema,      presence: true,
                          length: { minimum: 3 }
  validate :valid_imdb_link

  private

  def valid_imdb_link
    unless begins_with_tt? && contains_7_numbers? && is_9_characters_long?
      errors.add(:imdb_link, "Please submit a valid IMDb link.")
    end
  end

  def begins_with_tt?
    imdb_link[0...2] == "tt"
  end

  def contains_7_numbers?
    imdb_link.chars.select {|x| x[/\d+/]}.count == 7
  end

  def is_9_characters_long?
    imdb_link.length == 9
  end
end
