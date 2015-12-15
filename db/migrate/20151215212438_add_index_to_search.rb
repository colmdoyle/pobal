class AddIndexToSearch < ActiveRecord::Migration
  def change
    add_index(:searches, :address)
  end
end
