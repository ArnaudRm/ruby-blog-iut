class Post < ApplicationRecord
  mount_uploader :picture, AvatarUploader
  belongs_to :user
  has_many :comments, dependent: :delete_all
end
