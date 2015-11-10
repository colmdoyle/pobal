class Position < ActiveRecord::Base
  belongs_to :body
  belongs_to :constituency
  has_many :people, through: :memberships
  belongs_to :position_type

end
