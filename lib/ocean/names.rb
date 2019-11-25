require "ocean/names/version"
require "oj"
require "geokit"

module Ocean
  module Names
    class Error < StandardError; end

    GET_POINTS = ->(arg) {
      return arg unless arg.first.first.is_a?(Array)

      GET_POINTS.(arg.first)
    }

    WITHIN_BOUNDS = ->(record, x, y) {
      record["min_x"] <= x &&
      record["max_x"] >= x &&
      record["min_y"] <= y &&
      record["max_y"] >= y
    }

    def self.reverse_geocode(lat:, lng:)
      point = Geokit::LatLng.new(lat, lng)

      rec = data.find do |record|
        # avoid check of obviously false geometries
        next unless WITHIN_BOUNDS.(record, lat, lng)

        # get points from nested arrays
        source = GET_POINTS.(record["geometry"])

        points = source.map { |x| Geokit::LatLng.new(*x) }
        polygon = Geokit::Polygon.new(points)
        polygon.contains?(point)
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
