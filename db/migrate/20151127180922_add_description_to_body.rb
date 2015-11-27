class AddDescriptionToBody < ActiveRecord::Migration
  def change
    add_column :bodies, :description, :text
  end
end
