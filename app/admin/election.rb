ActiveAdmin.register Election do
  permit_params :name, :body_id, :polls_open_date, :polls_close_date

  active_admin_import

  form do |f|
    f.inputs do
      f.input :name
      f.input :body
      f.input :polls_open_date
      f.input :polls_close_date
    end
    f.actions
  end

end
