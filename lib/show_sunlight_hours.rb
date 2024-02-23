require 'http'

# @see https://sunrise-sunset.org/api
class ShowSunlightHours
  # Somerville, MA
  LAT = 42.3723008
  LONG = -71.10656

  URL = 'https://api.sunrise-sunset.org/json'.freeze

  class << self
    # @return [Float] Hours of sunlight
    def show
      body = HTTP
        .use(logging: { logger: Rails.logger })
        .get(URL, params: { lat: LAT, lng: LONG, formatted: 0 })
        .parse

      sunrise = Time.rfc3339(body['results']['sunrise'])
      sunset = Time.rfc3339(body['results']['sunset'])
      (sunset - sunrise)/60/60
    end
  end
end