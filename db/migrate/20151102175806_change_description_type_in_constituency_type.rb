class ChangeDescriptionTypeInConstituencyType < ActiveRecord::Migration
  def change
    change_column :constituency_types, :description, :text
  end
end
