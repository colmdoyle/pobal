class Election < ActiveRecord::Base
  belongs_to :body
  has_many :candidacies
end
