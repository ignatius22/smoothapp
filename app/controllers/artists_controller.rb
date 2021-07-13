class ArtistsController < ApplicationController

    def index
        @title = "List of Artist"
        @artists = User.all
    end

    def show
        @heading = "created albums"
        @user = User.find(params[:id])
        @albums = @user.albums.all
        @total_album = @user.albums.count
    end
    
    def artist_params
        params.require(:albums).
        permit(:name, :album_art)
    end
    
end
