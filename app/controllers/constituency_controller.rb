class ConstituencyController < ApplicationController
  def index
    @constituencies = Constituency.all.order(:name).page(params[:page])
  end

  def show
    @constituency = Constituency.find(params[:id])
    @current_members = Position.where(constituency: @constituency, end_date: nil).includes(:person).order("people.last_name ASC")
    @former_members = Position.where(constituency: @constituency).where.not(end_date: nil).includes(:person).order("people.last_name ASC")
  end

end
