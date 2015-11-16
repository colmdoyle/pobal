class AddSlugToPerson < ActiveRecord::Migration
  def change
    add_column :people, :slug, :string, :null => false
  end
end
