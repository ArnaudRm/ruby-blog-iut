class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  def to_s
    "#{firstname.capitalize} #{lastname.upcase}"
  end
end
