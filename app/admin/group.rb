ActiveAdmin.register Group do
  permit_params :name, :description, :homepage, :group_type_id,:avatar

  active_admin_import

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :homepage, as: :url
      f.input :group_type
      f.input :avatar, as: :file
    end
    f.actions
  end

end
