ActiveAdmin.register PositionType do

  permit_params :title, :short_description

  active_admin_import

  form do |f|
    f.inputs do
      f.input :title
      f.input :short_description
    end
    # Will preview the image when the object is edited
    f.actions
  end

end
