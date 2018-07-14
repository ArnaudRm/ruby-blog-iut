class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  def to_s
    "#{firstname.capitalize} #{lastname.capitalize}"
  end
end
