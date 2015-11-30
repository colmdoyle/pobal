class GroupTypeController < ApplicationController
  def index
    @group_types = GroupType.all.includes(:groups)
  end

  def show
    @group_type = GroupType.find(params[:id])
    @groups = Group.where(group_type: @group_type).order("name ASC")
  end
end
