class BodyController < ApplicationController
  def index
    @bodies = BodyType.all.includes(:bodies)
  end

  def show
    @body = Body.find(params[:id])
    @members = Position.where(body: @body).includes(:person).order("people.last_name ASC")
  end

end
