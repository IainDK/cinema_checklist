require 'rails_helper'

RSpec.describe Movie, type: :model do

  it 'creates a new record when all feilds are valid' do
   expect { Movie.create(movie_title: "Lost in Translation", watch_date: "28/10/2003",
   cinema: "Cineworld", imdb_link: "tt0335266") }.to change { Movie.count }.by(1)
 end

  it 'will not create a record if the movie_title is blank' do
    movie = Movie.create(movie_title: "", watch_date: "28/10/2003",
    cinema: "Cineworld", imdb_link: "tt0335266")
    expect(movie).not_to be_valid
  end

  it 'will not create a record if the watch_date is blank' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "",
    cinema: "Cineworld", imdb_link: "tt0335266")
    expect(movie).not_to be_valid
  end

  it 'will not create a record if the watch_date is not formatted correctly' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "10/2003",
    cinema: "Cineworld", imdb_link: "tt0335266")
    expect(movie).not_to be_valid
  end

  it 'will not create a record unless the cinema field contains at least 3 characters' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "28/10/2003",
    cinema: "Vu", imdb_link: "tt0335266")
    expect(movie).not_to be_valid
  end

  it 'will not create a record unless the imdb_link begins with tt' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "28/10/2003",
    cinema: "Cineworld", imdb_link: "ta0335266")
    expect(movie).not_to be_valid
  end

  it 'will not create a record unless the imdb_link contains exactly 7 numbers ' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "28/10/2003",
    cinema: "Cineworld", imdb_link: "tt033526")
    expect(movie).not_to be_valid
  end

  it 'will not create a record unless the imdb_link field begins with tt & contains exactly 7 numbers ' do
    movie = Movie.create(movie_title: "Lost in Translation", watch_date: "28/10/2003",
    cinema: "Cineworld", imdb_link: "tta0335266")
    expect(movie).not_to be_valid
  end
end
