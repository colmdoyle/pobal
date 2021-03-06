ActiveAdmin.register Group do
  permit_params :name, :description, :group_type_id, :avatar, :phone_number, :email, :website, :facebook, :twitter, :postal_address, :color

  active_admin_import

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :color
      f.input :group_type
      f.input :avatar, as: :file
      f.input :phone_number, as: :phone
      f.input :email
      f.input :website, as: :url
      f.input :facebook
      f.input :twitter
      f.input :postal_address
    end
    f.actions
  end
end
