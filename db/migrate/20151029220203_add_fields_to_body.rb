class AddFieldsToBody < ActiveRecord::Migration
  def change
    add_column :bodies, :name, :string
    add_column :bodies, :body_type, :string
  end
end
