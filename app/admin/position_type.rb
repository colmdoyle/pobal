ActiveAdmin.register PositionType do

  permit_params :title

  active_admin_import

  form do |f|
    f.inputs do
      f.input :title
    end
    # Will preview the image when the object is edited
    f.actions
  end

end
