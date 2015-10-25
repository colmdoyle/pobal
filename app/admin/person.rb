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
    f.input :avatar, as: :file, hint: f.template.image_tag(f.object.avatar.url(:thumb))
    # Will preview the image when the object is edited
    f.actions
  end

  show do |ad|
    attributes_table do
      row :avatar do
        image_tag(ad.avatar.url(:thumb))
      end
      # Will display the image on show object page
    end
  end
end
