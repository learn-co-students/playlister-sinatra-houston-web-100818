require_relative '../lib/library_parser'

Artist.destroy_all
Song.destroy_all
Genre.destroy_all
SongGenre.destroy_all

LibraryParser.parse
