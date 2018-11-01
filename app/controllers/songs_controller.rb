
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :"songs/index"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @genres = SongGenre.find_by(song_id: @song.id)
        erb :"songs/show"
    end 
    
    get '/songs/new' do
        @songs = Song.all
        erb :"songs/new"
    end 
end