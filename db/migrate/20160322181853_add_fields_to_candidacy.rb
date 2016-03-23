class AddFieldsToCandidacy < ActiveRecord::Migration
  def change
    add_reference :candidacies, :person, index: true, foreign_key: true
    add_reference :candidacies, :election, index: true, foreign_key: true
    add_reference :candidacies, :constituency, index: true, foreign_key: true
  end
end
