class AddTitleSubcategoryToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :title_sub_category, :text
  end
end
