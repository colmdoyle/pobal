class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|

      t.timestamps null: false
    end
  end
end
