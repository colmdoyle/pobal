class AddBodyTypeToBody < ActiveRecord::Migration
  def change
    add_reference :bodies, :body_type, index: true, foreign_key: true
  end
end
