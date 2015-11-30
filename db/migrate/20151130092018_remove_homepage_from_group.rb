class RemoveHomepageFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :homepage, :string
  end
end
