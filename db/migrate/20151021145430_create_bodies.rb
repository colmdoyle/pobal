class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|

      t.timestamps null: false
    end
  end
end
