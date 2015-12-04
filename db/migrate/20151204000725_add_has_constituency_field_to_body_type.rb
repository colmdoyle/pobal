class AddHasConstituencyFieldToBodyType < ActiveRecord::Migration
  def change
    add_column :body_types, :has_constituencies, :boolean, default: true
  end
end
