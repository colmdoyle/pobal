ActiveAdmin.register Person do
  permit_params :first_name, :last_name, :phone_number, :email, :website, :facebook, :twitter, :postal_address, :gender, :avatar, :slug

  active_admin_import

  form do |f|
    f.inputs do
      f.input :avatar, as: :file
      f.input :first_name
      f.input :last_name
      f.input :phone_number, as: :phone
      f.input :email
      f.input :website, as: :url
      f.input :facebook
      f.input :twitter
      f.input :postal_address
      f.input :gender, :as => :radio, :collection => ["female", "male", "transgender", "unknown"]
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone_number
    column :email
    column :website
    column :facebook
    column :twitter
    column :postal_address
    column :gender
    actions
  end

end
