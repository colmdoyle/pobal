class Position < ActiveRecord::Base
  has_one :body
  has_one :constituency
end
