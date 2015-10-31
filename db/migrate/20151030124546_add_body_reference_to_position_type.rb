class AddBodyReferenceToPositionType < ActiveRecord::Migration
  def change
    add_reference :position_types, :body, index: true
  end
end
