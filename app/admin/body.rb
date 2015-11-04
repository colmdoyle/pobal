ActiveAdmin.register Body do
  permit_params :name, :body_type_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :body_type
    end
    f.actions
  end

end
