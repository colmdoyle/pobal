class AddSlugIndexesToObjects < ActiveRecord::Migration
  def change
    add_index(:constituencies, :slug)
    add_index(:body_types, :slug)
    add_index(:bodies, :slug)
    add_index(:constituency_types, :slug)
    add_index(:group_types, :slug)
    add_index(:groups, :slug)
    add_index(:people, :slug)
    add_index(:position_types, :slug)
  end
end
