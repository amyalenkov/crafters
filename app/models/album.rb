class Album < ActiveRecord::Base

  has_many :album_images
  belongs_to :crafter

  mount_uploader :logo, CrafterAlbumLogoUploader

end
