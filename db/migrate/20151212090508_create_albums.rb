class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :crafter
      t.string :logo
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
