ActiveAdmin.register Candidacy do
  permit_params :election_id, :person_id, :constituency_id, :note

  active_admin_import

  form do |f|
    f.inputs do
      f.input :election
      f.input :person
      f.input :constituency
      f.input :note
    end
    f.actions
  end

end
