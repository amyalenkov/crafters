class AddLikeCounterForCrafter < ActiveRecord::Migration
  def change
    add_column :crafters, :like_counter, :integer, default: 0
  end
end
