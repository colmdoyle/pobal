class PersonController < ApplicationController
  def index
    @people = Person.all.page(params[:page])
  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
