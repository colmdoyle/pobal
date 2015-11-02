class CreateConstituencyTypes < ActiveRecord::Migration
  def change
    create_table :constituency_types do |t|

      t.timestamps null: false
    end
  end
end
