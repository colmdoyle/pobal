class ConstituencyController < ApplicationController
  def index
    @constituencies = Constituency.all.order(:name).page(params[:page])
  end

  def show
    @constituency = Constituency.find(params[:id])
    @members = Position.where(constituency: @constituency).includes(:person).order("people.last_name ASC")
  end

end
