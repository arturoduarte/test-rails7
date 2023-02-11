require 'net/http'

class FetchCountryService
  attr_reader :ip

  def initialize(ip)
    @ip = ip
  end

  def perform
    uri = URI("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)
    status = parsed_response['status']
    parsed_response['countryCode'].downcase if status == 'success'
  rescue StandardError
    'Hubo un problema con el endpoint!'
  end
end
