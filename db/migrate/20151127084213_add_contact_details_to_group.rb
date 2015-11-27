class AddContactDetailsToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :phone_number, :string
    add_column :groups, :email, :string
    add_column :groups, :facebook, :string
    add_column :groups, :twitter, :string
    add_column :groups, :postal_address, :string
  end
end
