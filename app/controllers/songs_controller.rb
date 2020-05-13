class SongsController < ApplicationController

    get '/songs/?' do
        erb :songs
    end

    get '/songs/new' do
        erb :songs_new
       end
    
    get '/songs/:slug' do 
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :song
    end
    
    get '/songs/:slug/edit' do
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :edit_song
    end

    post '/songs' do
        song = Song.new(params[:song])
        song.save
        artist = Artist.find_or_create_by(name: params[:artist_name])
        song.artist = artist
        params[:genres].each do |genre_id|
            SongGenre.create(song_id: song.id, genre_id: genre_id.to_i)
        end
        song.save
        flash[:message] = "Successfully created song."
        redirect ("/songs/#{song.slug}")
        
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        # @song = Song.find_by(id: params[:id].to_i)
        @song.name = params[:song][:name]
        artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.artist = artist
        @song.song_genres.each do |sg|
            sg.destroy
        end
        params[:genres].each do |genre_id|
            SongGenre.create(song_id: @song.id, genre_id: genre_id.to_i)
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect ("/songs/#{@song.slug}")
    end
  


end