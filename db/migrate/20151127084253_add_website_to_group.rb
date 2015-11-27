class AddWebsiteToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :website, :string
  end
end
