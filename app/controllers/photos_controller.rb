class PhotosController < ApplicationController

before_action :find_album 
before_action :find_photo, only: [:show, :edit, :update, :destroy]


	def index
		@photos = Photo.where(:album_id => @album.id).order("created_at DESC")
	end

	def show
	
	end

	def new
		@photo = @album.photos.new
	end

	def create
    	@photo = Photo.new(photo_params)
		@photo.album_id = @album.id

		if @photo.save
			redirect_to album_path(@album), notice: "Succesfully posted."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @photo.update(photo_params)
			redirect_to album_photo_path(@album, @photo), notice: "Succesfully updated."
		else
			
			render 'edit'
		end
	end
	


	def destroy
		@photo.destroy
		redirect_to root_path
	end

	private
	def photo_params
		params.require(:photo).permit(:title, :description, :avatar, :body, :album_id, :comment)
	end

	def find_album
		@album = Album.find(params[:album_id])
	end

	def find_photo
		@photo = Photo.find(params[:id])
	end


end
