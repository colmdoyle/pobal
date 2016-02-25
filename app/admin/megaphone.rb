ActiveAdmin.register Megaphone do
  permit_params :message, :start_date, :end_date, :active
end
