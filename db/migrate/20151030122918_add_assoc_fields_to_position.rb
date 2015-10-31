class AddAssocFieldsToPosition < ActiveRecord::Migration
  def change
    add_reference :positions, :body, index: true
    add_reference :positions, :constituency, index: true
    add_reference :positions, :person, index: true
  end
end
