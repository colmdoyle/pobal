ActiveAdmin.register ConstituencyType do
  permit_params :name, :description, :mapit_code, :member_title_abbreviation, :short_description

  active_admin_import

end
