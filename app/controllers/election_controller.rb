# Controllers for Elections to bodies
class ElectionController < ApplicationController
  def index
    @elections = Election.all.includes(:bodies).includes(:body_types)
  end

  def show
    @election = Election.find(params[:id])
    @groups = @election.groups
    @group_breakdown = @groups.each_with_object(Hash.new(0)) { |group, counts| counts[group] += 1 }.sort_by{|k,v| v}.reverse
  end
end
