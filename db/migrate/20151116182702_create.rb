class Create < ActiveRecord::Migration
  def change
    add_column :bodies, :slug, :string, :null => false
    add_column :groups, :slug, :string, :null => false
    add_column :constituencies, :slug, :string, :null => false
    add_column :body_types, :slug, :string, :null => false
    add_column :constituency_types, :slug, :string, :null => false
    add_column :group_types, :slug, :string, :null => false
    add_column :position_types, :slug, :string, :null => false
  end
end
