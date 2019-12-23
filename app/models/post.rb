class Post < ApplicationRecord
	acts_as_votable

	mount_uploader :image, ImageUploader
	
	validates :image,presence:true, file_size: { less_than: 1.megabytes }
	validates :user_id, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	scope :of_followed_users, -> (following_users) { where user_id: following_users }
end
