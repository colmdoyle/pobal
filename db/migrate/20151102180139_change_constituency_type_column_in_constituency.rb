class ChangeConstituencyTypeColumnInConstituency < ActiveRecord::Migration
  def change
    add_reference :constituencies, :constituency_type, index: true
    remove_column :constituencies, :const_type
  end
end
