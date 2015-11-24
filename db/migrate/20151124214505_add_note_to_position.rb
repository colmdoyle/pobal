class AddNoteToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :note, :string
  end
end
