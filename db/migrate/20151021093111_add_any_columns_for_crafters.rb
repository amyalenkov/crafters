class AddAnyColumnsForCrafters < ActiveRecord::Migration
  def change
    add_column :crafters, :city, :text
    add_column :crafters, :address, :text
    add_column :crafters, :phone_number, :text
    add_column :crafters, :contact_person, :text
    add_column :crafters, :site, :text
    add_column :crafters, :work_time, :text
  end
end
