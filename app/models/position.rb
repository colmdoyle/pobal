class Position < ActiveRecord::Base
  belongs_to :body
  belongs_to :constituency
  has_many :people
  belongs_to :position_type

end
