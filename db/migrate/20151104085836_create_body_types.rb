class CreateBodyTypes < ActiveRecord::Migration
  def change
    create_table :body_types do |t|

      t.timestamps null: false
    end
  end
end
