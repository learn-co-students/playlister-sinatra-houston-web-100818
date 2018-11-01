class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    include Slugifiable::InstanceMethods
    def self.find_by_slug(slugged)

        self.find do |s|
            s.slug == slugged
        end

    end
end 