class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    include Slugifiable::InstanceMethods
    def self.find_by_slug(slugged)

        self.find do |s|
            s.slug == slugged
        end

    end
end 