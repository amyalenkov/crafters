class AddCompanyNameColumnToCrafters < ActiveRecord::Migration
  def change
    add_column :crafters, :company_name, :text
  end
end
