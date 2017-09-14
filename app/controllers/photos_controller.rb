class PhotosController < ApplicationController


before_action :find_photo, only: [:show, :edit, :update, :destroy]

	def index
		@photos = Photo.all.order("created_at DESC")
	end

	def show
	end

	def new
		#@album = Album.find(params[:album_id])
		#@album.user_id = current_user.id
		#@photo = current_user.album.photos.new
		@photo = Photo.new
	end


	def create
		@album = Album.find(params[:album_id])
    @photo = Photo.new(photo_params)
		@photo.album_id = @album.id
		#@photo = current_user.album.photo.new
		#@photo.avatar = params[:album_id]


		

		if @photo.save
			redirect_to album_photo_path(album_id: @album.id, id: @photo.id), notice: "Succesfully posted."
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @photo.update(photo_params)
			redirect_to @photo, notice: "Succesfully updated."
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
		params.require(:photo).permit(:title, :description, :avatar, :body, :album_id)
	end

	def find_photo
		@photo = Photo.find(params[:id])
	end


end
