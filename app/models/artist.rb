require_relative 'concerns/slugifiable'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Slugifiable.find_by_slug(slug, self)
  end

end
