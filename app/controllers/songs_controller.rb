require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :"songs/index"
    end

    get '/songs/new' do
        @songs = Song.all
        erb :"songs/new"
    end 

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/edit"
    end 

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])

        artist = Artist.find_or_create_by(name: params["artist"])
        @song.update(name: params["name"], artist: artist)

        
        params["genres"].each do |genre|
            SongGenre.where(song_id: @song.id, genre_id: genre.to_i).first_or_create
        end 
        flash[:message] = "Successfuly edit song"
        
        redirect "/songs/#{@song.slug}"
    end 

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end 

    post '/songs' do
        artist = Artist.find_or_create_by(name: params["artist"])
        @new_song = Song.create(name: params["name"], artist: artist)
        params["genres"].each do |genre|
            SongGenre.create(genre_id: genre, song_id: @new_song.id)
        end 
        flash[:message] = "Successfuly created song"
        redirect "/songs/#{@new_song.slug}"
    end 

    delete '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.destroy
        redirect '/songs'
    end
    
  
    
end