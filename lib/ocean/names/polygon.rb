# frozen_string_literal: true

module Ocean
  module Names
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
          # p = [lat, lng]
          y1 = p.first
          x1 = p.last
          y2 = last_point.first
          x2 = last_point.last

          if y1 < y && y2 >= y || y2 < y && y1 >= y
            odd_node = !odd_node if x1 + (y - y1) / (y2 - y1) * (x2 - x1) < x
          end

          last_point = p
        end

        odd_node
      end
    end
  end
end
