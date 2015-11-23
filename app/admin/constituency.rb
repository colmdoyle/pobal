ActiveAdmin.register Constituency do
  permit_params :name, :map_it_id, :constituency_type_id

  active_admin_import

  form do |f|
    f.inputs do
      f.input :name
      f.input :map_it_id
      f.input :constituency_type
    end
    f.actions
  end

  index do
    id_column
    column :name
    column :map_it_id
    column :constituency_type
    actions
  end

end
