class AddMapItToConstituencyType < ActiveRecord::Migration
  def change
    add_column :constituency_types, :mapit_code, :string
  end
end
