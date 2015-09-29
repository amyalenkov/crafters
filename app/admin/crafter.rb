ActiveAdmin.register Crafter do
  menu priority: 3

  permit_params :subcategory_id, :description
  index do
    selectable_column
    column :email
    column :description
    column :subcategory
    actions defaults: true
  end

end
