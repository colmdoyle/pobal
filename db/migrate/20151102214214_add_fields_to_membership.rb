class AddFieldsToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :start_date, :date
    add_column :memberships, :end_date, :date
    add_reference :memberships, :person, index: true
    add_reference :memberships, :group, index: true

  end
end
