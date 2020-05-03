require 'httparty'
require 'json'

class CovidCounter
  def self.total_confirmed
    get_response_body['TotalConfirmed']
  end

  def self.total_deaths
    get_response_body['TotalDeaths']
  end

  def self.total_recovered
    get_response_body['TotalRecovered']
  end

  def self.get_response_body
    response = HTTParty.get('https://api.covid19api.com/world/total')

    response.success? ? JSON.parse(response.body) : {}
  end
end
