ActiveAdmin.register Constituency do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :MapItID, :constituency_type_id

form do |f|
  f.inputs do
    f.input :name
    f.input :MapItID
    f.input :constituency_type
  end
  f.actions
end


end
