class RemoveBodyTypeStringFromBody < ActiveRecord::Migration
  def change
    remove_column :bodies, :body_type, :string
  end
end
