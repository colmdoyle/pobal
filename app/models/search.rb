class Search < ActiveRecord::Base
  geocoded_by :address
end
