class Album < ApplicationRecord
	has_many :photos
	belongs_to :user

	mount_uploader :avatar, AvatarUploader
end
