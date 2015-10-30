ActiveAdmin.register Person do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :first_name, :last_name, :phone_number, :email, :website, :facebook, :twitter, :postal_address, :gender, :avatar

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
      f.input :gender
      f.input :positions
    end
    # Will preview the image when the object is edited
    f.actions
  end

  # show do |ad|
  #   attributes_table do
  #     row :avatar do
  #       image_tag(ad.avatar.url(:thumb))
  #     end
  #     # Will display the image on show object page
  #   end
  # end
end
