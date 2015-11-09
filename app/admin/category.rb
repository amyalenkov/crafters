ActiveAdmin.register Category, as: "Crafter_categories"  do
  menu priority: 4

  permit_params :name

  index do
    selectable_column
    column :id
    column :name
  end


end
