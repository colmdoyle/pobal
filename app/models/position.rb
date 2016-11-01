class Position < ActiveRecord::Base
  auditable
  belongs_to :body
  belongs_to :constituency
  belongs_to :person
  belongs_to :position_type

  default_scope { order('end_date ASC') }

end
