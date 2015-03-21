class AddServiceToCrafters < ActiveRecord::Migration
  def change
    add_reference :crafters, :service, index: true
  end
end
