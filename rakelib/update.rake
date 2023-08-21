# frozen_string_literal: true

require 'open-uri'
require 'zip'

desc 'Download the latest MaxMind GeoLite2 City locations CSV into lib/db'
task :update, %i[license_key] do |_task, args|
  license_key = args[:license_key] || ENV.fetch('MAXMIND_LICENSE_KEY', nil)
  raise ArgumentError, 'Pass a MaxMind license key: rake "update[KEY]"' if license_key.to_s.empty?

  uri = URI.parse('https://download.maxmind.com/app/geoip_download')
  uri.query = URI.encode_www_form(edition_id: 'GeoLite2-City-CSV', license_key:, suffix: 'zip')

  path = File.expand_path('../lib/db/GeoLite2-City-Locations-en.csv', __dir__)
  filename = File.basename(path)

  csv = Zip::File.open_buffer(uri.open(&:read)) do |zip_file|
    zip_file.find { |entry| File.basename(entry.name) == filename }&.get_input_stream&.read
  end
  raise "#{filename} not found in the GeoLite2 archive" unless csv

  File.binwrite(path, csv)

  puts 'Done! 🎉'
end
