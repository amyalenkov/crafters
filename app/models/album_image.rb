class AlbumImage < ActiveRecord::Base

  belongs_to :album

  mount_uploader :image, CrafterAlbumImageUploader

end
