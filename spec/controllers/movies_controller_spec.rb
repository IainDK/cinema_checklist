require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe '#index' do

    it 'renders an array of every movie stored in the db' do
      movie = Movie.create(title: "Lost in Translation", year_of_release: 2003, watch_date: "28/10/2003",
      cinema: "Cineworld", imdb_link: "tt0335266")
      get :index
      expect(assigns(:movies)).to eq([movie])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe '#show' do

    it 'assigns the requested movie to @movie' do
      movie = Movie.create(title: "Lost in Translation", year_of_release: 2003, watch_date: "28/10/2003",
      cinema: "Cineworld", imdb_link: "tt0335266")
      get :show, params: { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the index template" do
      movie = Movie.create(title: "Lost in Translation", year_of_release: 2003, watch_date: "28/10/2003",
      cinema: "Cineworld", imdb_link: "tt0335266")
      get :show, params: { id: movie.id }
      expect(response).to render_template("show")
    end
  end

  describe '#new' do

    it 'renders the new template' do
      movie = Movie.create(title: "Lost in Translation", year_of_release: 2003, watch_date: "28/10/2003",
      cinema: "Cineworld", imdb_link: "tt0335266")
      get :new
      expect(response).to render_template("new")
    end
  end

  describe '#create' do

    it "creates a new contact" do
      expect { Movie.create(title: "Lost in Translation", year_of_release: 2003, watch_date: "28/10/2003",
      cinema: "Cineworld", imdb_link: "tt0335266") }.to change(Movie,:count).by(1)
    end
  end
end
