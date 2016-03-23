class AddFieldsToElection < ActiveRecord::Migration
  def change
    add_column :elections, :polls_open_date, :date
    add_column :elections, :polls_close_date, :date
  end
end
