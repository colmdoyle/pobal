class BodyController < ApplicationController
  def index
    @bodies = Body.all.order(:body_type_id).page(params[:page])
  end

  def show
    @body = Body.find(params[:id])
    @members = Position.where(body: @body).includes(:person).order("people.last_name ASC")
  end

end
