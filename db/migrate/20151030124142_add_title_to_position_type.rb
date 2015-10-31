class AddTitleToPositionType < ActiveRecord::Migration
  def change
    add_column :position_types, :title, :string
  end
end
