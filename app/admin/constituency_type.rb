ActiveAdmin.register ConstituencyType do
  permit_params :name, :description, :mapit_code, :member_title_abbreviation
end
