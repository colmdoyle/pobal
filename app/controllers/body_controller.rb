class BodyController < ApplicationController
  def index
    @bodies = BodyType.all.includes(:bodies)
  end

  def show # rubocop:disable Metrics/AbcSize
    @body = Body.find(params[:id])
    @groups = @body.groups
    @group_breakdown = @groups.each_with_object(Hash.new(0)) { |group, counts| counts[group] += 1 }.sort_by{|k,v| v}.reverse
    @current_members = Position.where(body: @body, end_date: nil).includes(:person).includes(:constituency).order("people.last_name ASC")
    @former_members = Position.where(body: @body).where.not(end_date: nil).includes(:person).includes(:constituency).order("people.last_name ASC")
  end

end
