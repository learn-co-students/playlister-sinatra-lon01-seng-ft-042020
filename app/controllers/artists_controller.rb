class ArtistsController < ApplicationController
    
    get '/artists/?' do
        erb :artists
    end

    get '/artists/:slug' do 
        slug = params[:slug]
        @artist = Artist.find_by_slug(slug)
        erb :artist
    end

end
