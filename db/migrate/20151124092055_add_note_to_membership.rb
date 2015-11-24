class AddNoteToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :note, :string
  end
end
