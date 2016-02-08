class BodyController < ApplicationController
  def index
    @bodies = BodyType.all.includes(:bodies)
  end

  def show
    @body = Body.find(params[:id])
    @current_members = Position.where(body: @body, end_date: nil).includes(:person).order("people.last_name ASC")
    @former_members = Position.where(body: @body).where.not(end_date: nil).includes(:person).order("people.last_name ASC")
  end

end
