ActiveAdmin.register Position do

  permit_params :body_id, :constituency_id, :person_id, :position_type_id, :start_date, :end_date

  form do |f|
    f.inputs do
      f.input :body
      f.input :constituency
      f.input :person
      f.input :position_type
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end

  index do
    id_column
    column :body
    column :constituency
    column :person
    column :position_type
    column :start_date
    column :end_date
    actions
  end

end
