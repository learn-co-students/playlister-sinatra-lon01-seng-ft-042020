class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres,  through: :song_genres

     #Instance method - Can slugify its name
    def slug
        self.name.downcase.gsub(' ', '-')
    end

    #Class method - given the slug can find a Song
    def self.find_by_slug(slug)
        Song.all.find {|song| song.slug == slug}
    end


end