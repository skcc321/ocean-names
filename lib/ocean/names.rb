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

    def self.reverse_geocode(lat:, lng:)
      point = Geokit::LatLng.new(lat, lng)

      data.find do |record|
        source = GET_POINTS.(record["geometry"])

        points = source.map { |x| Geokit::LatLng.new(*x) }
        polygon = Geokit::Polygon.new(points)
        polygon.contains?(point)
      end&.reject do |key|
        key == "geometry"
      end
    end

    def self.data
      @data || load_data
    end

    def self.load_data
      @data = Oj.load(File.read("data/water.json"))
    end
  end
end
