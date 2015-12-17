class SearchController < ApplicationController
  def index
    unless params['form-input'] && params['form-input'].length > 0
      redirect_to root_path
      return
    end
    @mapit_response = convert_address_to_mapit(params['form-input']) ? JSON.parse(convert_address_to_mapit(params['form-input']).mapit_response) : nil
    @search_results = {}
    unless @mapit_response.nil?
      @search_results = build_search_results(@mapit_response)
    end
  end

  def build_search_results(mapit_response)
    search_results = {}
    mapit_response.each do |_, value|

      constituency_type = ConstituencyType.find_by(mapit_code: value['type'])
      constituency = Constituency.find_by(map_it_id: value['id'], constituency_type: constituency_type)

      unless constituency.nil?
        constituency_reps = []
        for @representative in Position.where(constituency: constituency, end_date: nil).includes(:person)
          constituency_reps << @representative unless @representative.nil?
        end

        search_results[constituency.id] = {
          "constituency_type" => constituency_type,
          "constituency" => constituency,
          "representatives" => constituency_reps
        }
      end
    end
    return search_results
  end

  def convert_address_to_mapit(address)
    cached_location = Search.find_by(address: address)
    if cached_location.nil?
      location = Geocoder.coordinates(address)
      unless location.nil?
        cached_location = Search.create(latitude: location[1], longitude: location[0], address: address)
        query_to_mapit = HTTParty.get("#{Rails.application.secrets.mapit_url}#{cached_location.latitude},#{cached_location.longitude}")
        if query_to_mapit.code == 200
          cached_location.mapit_response = query_to_mapit.body
        else
          cached_location.mapit_response = "{}"
        end
        cached_location.save
      end
    end
    return cached_location
  end
end
