class PersonController < ApplicationController
  def index
    if params[:letter].nil?
      @people = Person.all.page(params[:page])
    else
      @people = Person.where("last_name LIKE ?", "#{params[:letter]}%").page(params[:page])
    end

  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
