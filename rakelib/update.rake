# frozen_string_literal: true

require 'cgi'
require 'zip'

BASE_URL = 'https://download.maxmind.com/app/geoip_download'

task :update, %i[license_key] do |_task, args|
  raise ArgumentError, 'license_key must be a String' unless args[:license_key].is_a?(String)

  uri = URI.parse(BASE_URL)
  uri.query = {
    edition_id: 'GeoLite2-City-CSV',
    license_key: '123',
    suffix: 'zip'
  }
              .map { |key, value| "#{key}=#{value}" }
              .join('&')

  Zip::File.open(uri.open) do |zip_file|
    zip_file.each do |entry|
      next unless present?(entry.name['GeoLite2-City-Locations-en'])

      filename = entry.name.split('/').last
      entry.extract(File.join('lib', 'db', filename)) { true }
      break
    end
  end

  puts 'Done! 🎉'
end
