class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    #Instance method - Can slugify its name
    def slug
        self.name.downcase.gsub(' ', '-')
    end

    #Class method - given the slug can find a Song
    def self.find_by_slug(slug)
        Genre.all.find {|genre| genre.slug == slug}
    end
end
