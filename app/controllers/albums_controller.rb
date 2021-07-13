class AlbumsController < ApplicationController
    # access all: [:show, :index], user: {except: [:destroy, :create]}, admin: :all
    

def index
    @title = "List of Albums"
    @albums = Album.all
end

def show
    @title = "Albums"
    @album = set_album
end

def new
    @album = Album.new  
end

def edit 
    @album = set_album
end

def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
        flash[:notice] = "Album was created successfully"
    redirect_to @album
    else
        render 'new'
    end
end

def update
    @album = set_album
	@album.user = current_user
	 if @album.update(album_params)
	 	flash[:notice] = "Album was edited successfully."
	 	redirect_to @album
	 else
	 	render 'edit'
	end
end



def destroy
    @album = set_album
	@album.user = current_user
    if current_user == @album.user
	   @album.destroy
    end
    flash[:notice] = "Album was deleted successfully"
	redirect_to albums_path
end
    

private

def set_album
    Album.find(params[:id])
end


def album_params
    params.require(:album).
    permit(:name, :album_image, :album_art)
end
    
end
