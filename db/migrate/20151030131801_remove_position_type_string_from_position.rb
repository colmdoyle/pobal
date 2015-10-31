class RemovePositionTypeStringFromPosition < ActiveRecord::Migration
  def change
    remove_column :positions, :position_type, :string
  end
end
