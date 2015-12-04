ActiveAdmin.register BodyType do
  permit_params :name, :has_constituencies

  active_admin_import

end
