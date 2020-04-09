# frozen_string_literal: true

module OceanNames
  class Polygon
    def initialize(points)
      @points = points
      @points << points[0] if points[0] != points[-1]
    end

    def contains?(lat:, lng:)
      last_point = @points[-1]

      odd_node = false

      x = lng
      y = lat

      @points.each do |p|
        # p = [lng, lat]
        x1 = p.first
        y1 = p.last
        x2 = last_point.first
        y2 = last_point.last

        if x1 < x && x2 >= x || x2 < x && x1 >= x
          odd_node = !odd_node if y1 + (x - x1) / (x2 - x1) * (y2 - y1) < y
        end

        last_point = p
      end

      odd_node
    end
  end
end
