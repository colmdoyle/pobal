class AddConstTypeFieldToConstituency < ActiveRecord::Migration
  def change
    add_column :constituencies, :const_type, :string
  end
end
