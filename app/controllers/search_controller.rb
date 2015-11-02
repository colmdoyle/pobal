class SearchController < ApplicationController
  def index
    @location = Geocoder.coordinates(params['form-input'])
    @search_results = {}
    @mapit_response = JSON.parse(HTTParty.get("#{Rails.application.secrets.mapit_url}#{@location[1]},#{@location[0]}").body)
    @mapit_response.each do |_, value|
      constituency = Constituency.find_by(MapItID: value['id'], const_type: value['type'])
      unless constituency.nil?
        constituency_reps = []
        @representatives = Position.where(constituency: constituency)
        for @representative in @representatives
          constituency_reps << @representative unless @representative.nil?
        end
        @search_results[constituency.const_type] = constituency_reps
      end
    end
  end
end
