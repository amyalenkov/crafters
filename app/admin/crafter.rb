ActiveAdmin.register Crafter do
  menu priority: 3

  permit_params :subcategory_id, :description, :check
  index do
    selectable_column
    column :email
    column :check
    column :company_name
    # column :description
    column :city
    column :address
    column :phone_number
    column :contact_person
    column :site
    column :work_time
    column :subcategory
    actions defaults: true
  end

end
