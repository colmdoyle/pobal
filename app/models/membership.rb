class Membership < ActiveRecord::Base
  auditable
  belongs_to :person
  belongs_to :group

  default_scope { order('end_date ASC') }
end
