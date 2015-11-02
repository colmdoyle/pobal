class SearchController < ApplicationController
  def index
    @location = Geocoder.coordinates(params['form-input'])
    @search_results = []
    @mapit_response = JSON.parse(HTTParty.get("#{Rails.application.secrets.mapit_url}#{@location[1]},#{@location[0]}").body)
    @mapit_response.each do |_, value|
      constituency = Constituency.find_by(MapItID: value['id'], const_type: value['type'])
      unless constituency.nil?
        @representatives = Position.where(constituency: constituency)
        for @representative in @representatives
          @search_results << @representative unless @representative.nil?
        end
      end
    end
  end
end
