class AddGroupTypeToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :group_type, index: true, foreign_key: true
  end
end
