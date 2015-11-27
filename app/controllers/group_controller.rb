class GroupController < ApplicationController
  def index
    @groups = Group.all.order(:group_type_id).page(params[:page])
  end

  def show
    @group = Group.find(params[:id])
  end

end
