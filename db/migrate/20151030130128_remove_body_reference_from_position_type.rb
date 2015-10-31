class RemoveBodyReferenceFromPositionType < ActiveRecord::Migration
  def change
    remove_reference :position_types, :body, index: true
  end
end
