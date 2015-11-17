class SearchController < ApplicationController
  def index
    @mapit_response = convert_address_to_mapit(params['form-input'])
    @search_results = {}
    @mapit_response.each do |_, value|

      constituency_type = ConstituencyType.find_by(mapit_code: value['type'])
      constituency = Constituency.find_by(map_it_id: value['id'], constituency_type: constituency_type)

      unless constituency.nil?
        constituency_reps = []
        @representatives = Position.where(constituency: constituency).includes(:person)

        for @representative in @representatives
          constituency_reps << @representative unless @representative.nil?
        end

        @search_results[constituency.id] = {
          "constituency_type" => constituency_type,
          "constituency" => constituency,
          "representatives" => constituency_reps
        }
      end
    end
  end

  def convert_address_to_mapit(address)
    @location = Geocoder.coordinates(address)
    @mapit_response = JSON.parse(HTTParty.get("#{Rails.application.secrets.mapit_url}#{@location[1]},#{@location[0]}").body)
  end
end
