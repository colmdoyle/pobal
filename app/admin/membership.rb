ActiveAdmin.register Membership do
  permit_params :group_id, :person_id, :start_date, :end_date

  form do |f|
    f.inputs do
      f.input :group
      f.input :person
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end
end
