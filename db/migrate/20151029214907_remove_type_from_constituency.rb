class RemoveTypeFromConstituency < ActiveRecord::Migration
  def change
    remove_column :constituencies, :type, :string
  end
end
