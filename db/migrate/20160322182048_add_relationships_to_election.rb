class AddRelationshipsToElection < ActiveRecord::Migration
  def change
    add_reference :elections, :body, index: true, foreign_key: true
  end
end
