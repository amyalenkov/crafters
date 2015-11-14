class AddAvatarForCrafter < ActiveRecord::Migration
  def change
    add_column :crafters, :avatar, :string
  end
end
