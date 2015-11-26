ActiveAdmin.register Body do
  permit_params :name, :body_type_id, :avatar

  active_admin_import

  form do |f|
    f.inputs do
      f.input :name
      f.input :body_type
      f.input :avatar, as: :file
    end
    f.actions
  end

end
