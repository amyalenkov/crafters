class RenameServiceTableToSubcategory < ActiveRecord::Migration
  def self.up
    rename_table :services, :subcategories
  end

  def self.down
    rename_table :subcategories, :services
  end
end
