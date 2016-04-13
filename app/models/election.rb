class Election < ActiveRecord::Base
  belongs_to :body
  has_many :candidacies

  def groups
    groups = []
    candidacies.each do |candidacy|
      groups << candidacy.person.current_party
    end
    groups
  end

end
