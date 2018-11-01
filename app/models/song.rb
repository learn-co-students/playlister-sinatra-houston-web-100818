require_relative 'concerns/slugifiable'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Slugifiable.find_by_slug(slug, self)
  end
  
end
