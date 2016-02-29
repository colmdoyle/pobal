class AddColorFieldToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :color, :string
  end
end
