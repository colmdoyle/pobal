class AddFieldsToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :name, :string
    add_column :groups, :description, :text
    add_column :groups, :homepage, :string
  end
end
