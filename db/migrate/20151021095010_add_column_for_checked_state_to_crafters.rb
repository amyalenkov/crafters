class AddColumnForCheckedStateToCrafters < ActiveRecord::Migration
  def change
    add_column :crafters, :check, :boolean, default: false
  end
end
