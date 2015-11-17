class ReplaceMapItFieldInConstituency < ActiveRecord::Migration
  def change
    add_column :constituencies, :map_it_id, :integer
    remove_column :constituencies, :MapItID, :integer
  end
end
