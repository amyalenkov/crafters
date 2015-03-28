class AddDescriptionToCrafter < ActiveRecord::Migration
  def change
    add_column :crafters, :description, :text
  end
end
