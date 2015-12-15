class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.text :mapit_response
      t.timestamps null: false
    end
  end
end
