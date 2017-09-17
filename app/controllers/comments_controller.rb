class CommentsController < ApplicationController
	before_action :find_album
	before_action :find_photo
	before_action :find_comment, only: [:edit, :update, :destroy]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.photo_id = @photo.id
		@comment.user_id = current_user.id 

		if @comment.save
			redirect_to album_photo_path(@album, @photo)
		else
			render 'new'
		end
	end

	def edit 
	end

	def update
		if @comment.update(comment_params)
			redirect_to album_photo_path(@album, @photo)
		else 
			render 'edit'
		end
	end

	def destroy
		@comment.destroy 
		redirect_to album_photo_path(@album, @photo)
	end
	

	private
	def comment_params 
		params.require(:comment).permit(:body, :post_id, :user_id, :album_id)
	end

	def find_album
		@album = Album.find(params[:album_id])
	end

	def find_photo
		@photo = Photo.find(params[:photo_id])
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end

end
