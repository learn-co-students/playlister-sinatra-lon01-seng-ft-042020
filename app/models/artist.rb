require "pry"
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    #Instance method - Can slugify its name
    def slug
        self.name.downcase.gsub(' ', '-')
    end

    #Class method - given the slug can find an Artist
    def self.find_by_slug(slug)
        Artist.all.find {|artist| artist.slug == slug}
    end
end



