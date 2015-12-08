class GroupController < ApplicationController
  def index
    @groups = GroupType.all.includes(:groups)
  end

  def show
    @group = Group.find(params[:id])
  end

end
