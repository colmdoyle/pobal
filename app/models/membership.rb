class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :group
end
