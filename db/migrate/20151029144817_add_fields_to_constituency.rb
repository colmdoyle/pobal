class AddFieldsToConstituency < ActiveRecord::Migration
  def change
    add_column :constituencies, :name, :string
    add_column :constituencies, :MapItID, :integer
    add_column :constituencies, :type, :string
  end
end
