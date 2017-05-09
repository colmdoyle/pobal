class PersonController < ApplicationController
  def index
    @people = if params[:letter].nil?
                Person.all.page(params[:page])
              else
                Person.where("last_name LIKE ?", "#{params[:letter]}%").page(params[:page])
              end
  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
