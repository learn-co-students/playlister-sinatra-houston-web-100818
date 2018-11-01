
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :"songs/index"
    end

    get '/songs/:id' do
        @song = Song.find(params[:id])
        @genres = SongGenre.find_by(song_id: params[:id])
        erb :"songs/show"
    end 
    
    get '/songs/new' do
        @songs = Song.all
        erb :"songs/new"
    end 
end