class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|

      t.timestamps null: false
    end
  end
end
