class WelcomeController < ApplicationController
  def index
    @representatives_count = Person.all.count
  end
end
