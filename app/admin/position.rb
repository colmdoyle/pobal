ActiveAdmin.register Position do

  permit_params :body, :constituency, :person, :position_type, :start_date, :end_date

  form do |f|
    f.inputs do
      f.input :body
      f.input :constituency
      f.input :person
      f.input :position_type
      f.input :start_date
      f.input :end_date
    end
    # Will preview the image when the object is edited
    f.actions
  end

end
