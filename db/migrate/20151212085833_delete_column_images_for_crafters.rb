class DeleteColumnImagesForCrafters < ActiveRecord::Migration
  def change
    remove_column :crafters, :images
  end
end
