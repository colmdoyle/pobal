class RemoveProfilePictureFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :profile_picture, :string
  end
end
