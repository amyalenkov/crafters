ActiveAdmin.register Crafter do

  permit_params :service_id, :description
  index do
    selectable_column
    column :email
    column :description
    column :service
    actions defaults: true
  end

end
