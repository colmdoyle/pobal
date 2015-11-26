class AddShortDescriptionToConstituencyType < ActiveRecord::Migration
  def change
    add_column :constituency_types, :short_description, :string
  end
end
