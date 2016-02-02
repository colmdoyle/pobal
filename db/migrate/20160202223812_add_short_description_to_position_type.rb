class AddShortDescriptionToPositionType < ActiveRecord::Migration
  def change
    add_column :position_types, :short_description, :string
  end
end
