ActiveAdmin.register PositionType do

  permit_params :title

  form do |f|
    f.inputs do
      f.input :title
    end
    # Will preview the image when the object is edited
    f.actions
  end

end
