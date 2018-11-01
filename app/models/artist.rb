require_relative 'concerns/slugifiable'
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    include Slugifiable::InstanceMethods
    def self.find_by_slug(slugged)

        self.all.find do |s|
            s.slug == slugged
        end

    end

end     