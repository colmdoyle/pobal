class AddFieldsToConstituencyType < ActiveRecord::Migration
  def change
    add_column :constituency_types, :name, :string
    add_column :constituency_types, :description, :string
    add_column :constituency_types, :member_title_abbreviation, :string
  end
end
