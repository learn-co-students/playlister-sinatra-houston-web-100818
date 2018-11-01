class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  post '/songs/:slug' do

    song = Song.find_or_create_by(name: params[:song_name])
    artist = Artist.find_or_create_by(name: params[:artist_name])

    params[:genres].each do |genre_id|
      genre = Genre.find(genre_id)
      song.song_genres.build(genre: genre)
    end

    song.artist = artist

    song.save

    redirect "/songs/#{song.slug}"
  end

  patch '/songs/:slug' do
    song = Song.find(params[:id])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.name = params[:song_name]
    artist.songs << song

    SongGenre.all.where(song_id: song.id).each { |song_genre| song_genre.destroy }

    params[:genres].each do |genre_id|
      genre = Genre.find(genre_id)
      song.song_genres.build(genre: genre)
    end

    song.save

    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :edit
  end

end
