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
      case record["name"]
      when /Pacific Ocean/ then true # exception of this rule
      else
        [record["min_x"], record["max_x"]].min <= x &&
          [record["min_x"], record["max_x"]].max >= x &&
          [record["min_y"], record["max_y"]].min <= y &&
          [record["min_y"], record["max_y"]].max >= y
      end
    }

    def self.reverse_geocode(lat:, lng:)
      rec = data.find do |record|
        # avoid check of obviously false geometries
        next unless WITHIN_BOUNDS.(record, lng, lat)

        record["geometry"].any? do |geometry|
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
