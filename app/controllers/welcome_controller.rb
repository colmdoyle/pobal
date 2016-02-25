class WelcomeController < ApplicationController
  def index
    @representatives_count = Person.all.count
    @active_megaphone = Megaphone
                        .where('start_date <= ?', DateTime.now.to_time)
                        .where('end_date >= ?', DateTime.now.to_time)
                        .where(active: true)
                        .last
  end
end
