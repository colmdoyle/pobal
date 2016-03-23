class AddNoteToCandidacy < ActiveRecord::Migration
  def change
    add_column :candidacies, :note, :text
  end
end
