class PersonController < ApplicationController
  def index
    @people = Person.all.order(:last_name).page(params[:page])
  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
