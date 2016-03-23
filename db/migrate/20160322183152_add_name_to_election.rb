class AddNameToElection < ActiveRecord::Migration
  def change
    add_column :elections, :name, :string
  end
end
