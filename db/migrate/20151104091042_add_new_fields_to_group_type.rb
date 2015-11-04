class AddNewFieldsToGroupType < ActiveRecord::Migration
  def change
    add_column :group_types, :name, :string
  end
end
