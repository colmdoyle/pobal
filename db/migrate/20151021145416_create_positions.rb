class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|

      t.timestamps null: false
    end
  end
end
