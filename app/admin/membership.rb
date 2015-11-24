ActiveAdmin.register Membership do
  permit_params :group_id, :person_id, :note, :start_date, :end_date

  form do |f|
    f.inputs do
      f.input :group
      f.input :person
      f.input :note
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end

  index do
    id_column
    column :group
    column :person
    column :note
    column :start_date
    column :end_date
    actions
  end

end
