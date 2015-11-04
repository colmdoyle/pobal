class Body < ActiveRecord::Base
  has_many :positions
  belongs_to :body_type
end
