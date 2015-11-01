class SearchController < ApplicationController
  def index
    @location = Geocoder.coordinates(params['form-input'])
    @current_reps = []
    @mapit_response = JSON.parse(HTTParty.get("#{Rails.application.secrets.mapit_url}#{@location[1]},#{@location[0]}").body)
    @mapit_response.each do |_, value|
      constituency = Constituency.find_by(MapItID: value['id'], const_type: value['type'])
      unless constituency.nil?
        @position = Position.find_by(constituency: constituency)
        @current_reps << @position unless @position.nil?
      end
    end
  end
end
