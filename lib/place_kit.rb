# frozen_string_literal: true

require 'active_support/all'
require 'csv'
require 'fastcsv'

module PlaceKit
  DB = File.join(__dir__, 'db', 'GeoLite2-City-Locations-en.csv')

  @cache = {}

  # Look up time zone.
  #
  # @param [String|Symbol] country Country ISO code.
  # @param [String|Symbol] region Region ISO (subdivison 1) code.
  # @param [String|Symbol] city City name.
  def self.lookup(country, region, city)
    country = country.to_s.humanize.downcase
    region = region.to_s.humanize.downcase
    city = city.to_s.humanize.downcase

    val = @cache.dig(country, region, city)
    return val if val

    @cache[country] ||= {}
    @cache[country][region] ||= {}

    File.open(DB) do |f|
      FastCSV.raw_parse(f) do |entry|
        next unless entry[4]&.downcase == country &&
                    entry[6]&.downcase == region &&
                    entry[10]&.downcase == city

        time_zone = ActiveSupport::TimeZone.new(entry[12])

        @cache[country][region][city] = time_zone

        return time_zone
      end
    end

    @cache[country][region][city] = nil
  end
end
