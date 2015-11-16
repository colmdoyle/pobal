ActiveAdmin.register Person do
  permit_params :first_name, :last_name, :phone_number, :email, :website, :facebook, :twitter, :postal_address, :gender, :avatar, :slug

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
      f.input :gender, :as => :radio, :collection => ["Female", "Male", "Trans", "Unknown"]
    end
    f.actions
  end

end
