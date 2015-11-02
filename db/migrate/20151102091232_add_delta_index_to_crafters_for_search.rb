class AddDeltaIndexToCraftersForSearch < ActiveRecord::Migration
  def change
    add_column :crafters, :delta, :boolean, :default => true, :null => false
  end
end
