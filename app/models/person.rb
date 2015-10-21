class Person < ActiveRecord::Base
  has_many :bodies
  has_many :positions
  has_many :constituencies
end
