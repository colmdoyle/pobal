class Candidacy < ActiveRecord::Base
  belongs_to :election
  belongs_to :constituency
  belongs_to :person
end
