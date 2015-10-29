class SearchController < ApplicationController
  def index
    @location = Geocoder.coordinates(params['form-input'])
    @constituencies = []
    @mapit_response = JSON.parse(HTTParty.get("#{Rails.application.secrets.mapit_url}#{@location[1]},#{@location[0]}").body)
    @mapit_response.each do |key, value|
      constituency = Constituency.find_by(MapItID: value['id'], const_type: value['type'])
      @constituencies << constituency unless constituency.nil?
    end
  end
end
