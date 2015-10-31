class AddPositionTypeToPosition < ActiveRecord::Migration
  def change
    add_reference :positions, :position_type, index: true, foreign_key: true
  end
end
