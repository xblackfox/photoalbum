class AlbumsController < ApplicationController

before_action :find_album, only: [:show, :edit, :update, :destroy]

	def index
		@albums = Album.all.order("created_at DESC")
	end

	def show
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params)
		@album.user_id = current_user.id
		if @album.save
			redirect_to @album, notice: "Succesfully posted."
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @album.update(album_params)
			redirect_to @album, notice: "Succesfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@album.destroy
		redirect_to root_path
	end

	private
	def album_params
		params.require(:album).permit(:title, :description, :avatar, :body, :user_id, :photo_id)
	end

	def find_album
		@album = Album.find(params[:id])
	end

end
