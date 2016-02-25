class AddFieldsToMegaphone < ActiveRecord::Migration
  def change
    add_column :megaphones, :message, :string
    add_column :megaphones, :start_date, :datetime
    add_column :megaphones, :end_date, :datetime
  end
end
