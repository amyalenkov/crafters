class CreateAlbumImages < ActiveRecord::Migration
  def change
    create_table :album_images do |t|
      t.belongs_to :album
      t.string :name
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
