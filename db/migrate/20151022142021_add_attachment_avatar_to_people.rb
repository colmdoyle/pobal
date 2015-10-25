class AddAttachmentAvatarToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :people, :avatar
  end
end
