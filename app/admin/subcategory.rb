ActiveAdmin.register Subcategory, as: "Crafter_subcategories" do
  menu priority: 5
  permit_params :name, :category_id
  index do
    selectable_column
    column :name
    # column :category
    actions defaults: true
  end


end
