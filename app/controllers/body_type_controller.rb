class BodyTypeController < ApplicationController
  def index
    @body_types = BodyType.all.includes(:bodies)
  end

  def show
    @body_type = BodyType.find(params[:id])
    @bodies = Body.where(body_type: @body_type).order("name ASC")
  end
end
