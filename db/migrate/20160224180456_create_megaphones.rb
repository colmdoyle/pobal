class CreateMegaphones < ActiveRecord::Migration
  def change
    create_table :megaphones do |t|

      t.timestamps null: false
    end
  end
end
