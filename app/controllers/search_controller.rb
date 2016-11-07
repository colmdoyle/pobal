class SearchController < ApplicationController
  def index
    unless params['form-input'] && !params['form-input'].empty?
      redirect_to root_path
      return
    end

    mapit = convert_address_to_mapit(params['form-input'])
    mapit_response = JSON.parse(mapit.mapit_response) if mapit && mapit.mapit_response
    @search_results = {}
    unless mapit_response.nil?
      @search_results = build_search_results(mapit_response)
    end
  end

  private

  def build_search_results(mapit_response)
    search_results = {}
    mapit_response.each do |_, value|

      constituency_type = ConstituencyType.find_by(mapit_code: value['type'])
      constituency = Constituency.find_by(map_it_id: value['id'], constituency_type: constituency_type)

      next if constituency.nil?
      constituency_reps = Hash.new { |hash, key| hash[key] = [] }
      for @representative in Position.where(constituency: constituency, end_date: nil).includes(:person)
        constituency_reps[@representative.position_type] << @representative unless @representative.nil?
      end
      search_results[constituency.id] = {
        "constituency_type" => constituency_type,
        "constituency" => constituency,
        "representatives" => constituency_reps
      }
    end
    search_results
  end

  def convert_address_to_mapit(address)
    cached_location = Search.find_by(address: address)
    if cached_location.nil?
      location = Geocoder.coordinates(address)
      unless location.nil?
        cached_location = Search.create(latitude: location[1], longitude: location[0], address: address)
        cached_location.mapit_response = process_mapit_response(HTTParty.get("#{Rails.application.secrets.mapit_url}#{cached_location.latitude},#{cached_location.longitude}"))
        cached_location.save
      end
    end
    cached_location
  end

  def process_mapit_response(query_to_mapit)
    if query_to_mapit.code == 200
      query_to_mapit.body
    else
      Rails.logger.info "Mapit failure code #{query_to_mapit.code}"
      "{}"
    end
  end
end
