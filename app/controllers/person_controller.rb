class PersonController < ApplicationController
  def index
    @people = if params[:letter].nil?
                Person.all.includes(:current_position).page(params[:page])
              else
                Person.where("last_name LIKE ?", "#{params[:letter]}%").includes(:current_position).page(params[:page])
              end
  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
