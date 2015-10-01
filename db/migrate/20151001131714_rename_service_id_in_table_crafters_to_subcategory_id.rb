class RenameServiceIdInTableCraftersToSubcategoryId < ActiveRecord::Migration
  def change
    rename_column :crafters, :service_id, :subcategory_id
  end
end
