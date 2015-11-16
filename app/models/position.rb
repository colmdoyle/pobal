class Position < ActiveRecord::Base
  belongs_to :body
  belongs_to :constituency
  belongs_to :person
  belongs_to :position_type

end
