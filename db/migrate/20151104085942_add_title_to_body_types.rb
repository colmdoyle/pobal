class AddTitleToBodyTypes < ActiveRecord::Migration
  def change
    add_column :body_types, :name, :string
  end
end
