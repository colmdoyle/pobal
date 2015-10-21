class AddFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :first_name, :string
    add_column :people, :last_name, :string
    add_column :people, :phone_number, :string
    add_column :people, :email, :string
    add_column :people, :website, :string
    add_column :people, :facebook, :string
    add_column :people, :twitter, :string
    add_column :people, :profile_picture, :string
    add_column :people, :postal_address, :string
    add_column :people, :gender, :string
  end
end
