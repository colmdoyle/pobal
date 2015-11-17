ActiveAdmin.register Constituency do
  permit_params :name, :MapItID, :constituency_type_id

  active_admin_import
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :MapItID
      f.input :constituency_type
    end
    f.actions
  end
end
