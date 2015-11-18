class AddImagesForCrafter < ActiveRecord::Migration
  def change
    add_column :crafters, :images, :json, null: false, default: '{}'
  end
end
