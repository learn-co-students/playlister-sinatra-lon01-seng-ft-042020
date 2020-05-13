class GenresController < ApplicationController

    get '/genres/?' do
        erb :genres
    end

    

    get '/genres/:slug' do 
        slug = params[:slug]
        @genre = Genre.find_by_slug(slug)
        erb :genre
    end

end