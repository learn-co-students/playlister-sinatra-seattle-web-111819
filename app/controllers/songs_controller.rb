class SongsController < ApplicationController

    get "/songs" do
        @songs = Song.all
        erb :"songs/index"
    end

    get "/songs/new" do
        @genres = Genre.all
        erb :"songs/new"
    end

    post "/songs" do
        @artist = Artist.find_or_create_by(params[:artist])
        params[:song][:artist_id] = @artist.id
        @song = Song.create(params[:song])
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @song_artist = @song.artist
        @song_genres = @song.genres
        @genres = Genre.all
        erb :"songs/edit"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres
        erb :"songs/show"
    end

    patch "/songs/:slug" do
        @artist = Artist.find_or_create_by(params[:artist])
        params[:song][:artist_id] = @artist.id
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @artist = @song.artist
        @genres = @song.genres
        flash[:message] = "Successfully updated song."
        erb :"songs/show"
    end

end