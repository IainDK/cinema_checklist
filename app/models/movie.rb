class Movie < ApplicationRecord

  validates :title, presence: true
  validates :watch_date,  presence: true,
                          format: { with: is_a?(Date) }
  validates :cinema,      presence: true,
                          length: { minimum: 3 }
  validate :valid_imdb_link
  validate :valid_year_of_release

  def uk_date_format
    watch_date.to_s.split("-").reverse.join("-")
  end

  private

  def valid_imdb_link
    unless imdb_begins_with_tt? && imdb_contains_7_numbers? && imdb_is_9_characters_long?
      errors.add(:imdb_link, "Please submit a valid IMDb link.")
    end
  end

  def valid_year_of_release
    unless release_year_in_present_time? && release_year_is_4_characters_long?
      errors.add(:year_of_release, "Please submit a valid release date.")
    end
  end

  def imdb_begins_with_tt?
    imdb_link[0...2] == "tt"
  end

  def imdb_contains_7_numbers?
    imdb_link.chars.select { |x| x[/\d+/] }.count == 7
  end

  def imdb_is_9_characters_long?
    imdb_link.length == 9
  end

  def release_year_in_present_time?
    year_of_release.to_i <= Time.now.to_s.split("-").first.to_i
  end

  def release_year_is_4_characters_long?
    year_of_release.to_s.length == 4
  end
end
