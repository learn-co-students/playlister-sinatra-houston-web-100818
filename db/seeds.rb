# Add seed data here. Seed your database with `rake db:seed`

Song.destroy_all
Artist.destroy_all
Genre.destroy_all
SongGenre.destroy_all

files = Dir.entries('./db/data/')

files.map do |song_string|
    
    @remaining_part_of_string = song_string.split(" - ")[1]
    song_artist = song_string.split(" -")[0]

    if @remaining_part_of_string != nil
        song_name_genre = @remaining_part_of_string.split(' [')
        song_name = song_name_genre[0]
        
        song_genre= song_name_genre[1].split(']')[0]

        artist = Artist.find_or_create_by(name: song_artist)
        genre = Genre.find_or_create_by(name: song_genre)
        song = Song.create(name: song_name, artist: artist)
        SongGenre.create(song: song, genre: genre)
        
    end 
end 
