class AddAvatarsToGroupsAndBodies < ActiveRecord::Migration
  def self.up
    change_table :bodies do |t|
      t.attachment :avatar
    end
    change_table :groups do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :groups, :avatar
    remove_attachment :bodies, :avatar
  end
end
