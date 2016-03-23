class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|

      t.timestamps null: false
    end
  end
end
