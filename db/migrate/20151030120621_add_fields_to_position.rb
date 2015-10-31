class AddFieldsToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :position_type, :string
    add_column :positions, :start_date, :date
    add_column :positions, :end_date, :date
  end
end
