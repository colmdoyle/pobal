class AddActiveFieldToMegaphone < ActiveRecord::Migration
  def change
    add_column :megaphones, :active, :boolean
  end
end
