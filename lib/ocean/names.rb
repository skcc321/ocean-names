# frozen_string_literal: true

require "ocean/names/version"
require "ocean/names/polygon"
require "oj"

module Ocean
  module Names
    class Error < StandardError; end

    # drill down to main geometry points array
    GET_POINTS = ->(arg) {
      return arg unless arg.first.first.is_a?(Array)

      GET_POINTS.(arg.first)
    }

    # check bounds to avoid
    WITHIN_BOUNDS = ->(record, x, y) {
      record["min_x"] <= x &&
      record["max_x"] >= x &&
      record["min_y"] <= y &&
      record["max_y"] >= y
    }

    def self.reverse_geocode(lat:, lng:)
      rec = data.find do |record|
        record["geometry"].any? do |geometry|
          # avoid check of obviously false geometries
          next unless WITHIN_BOUNDS.(record, lng, lat)

          # get points from nested arrays
          points = GET_POINTS.(geometry)
          polygon = Ocean::Names::Polygon.new(points)
          polygon.contains?(lat: lat, lng: lng)
        end
      end

      rec&.reject do |key|
        key == "geometry"
      end
    end

    def self.data
      @data ||= Oj.load(File.read(File.expand_path("../../data/water.json", File.dirname(__FILE__))))
    end
  end
end
