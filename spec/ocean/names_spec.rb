# frozen_string_literal: true

require "spec_helper"

RSpec.describe Ocean::Names, :aggregate_failures do
  it "has a version number" do
    expect(Ocean::Names::VERSION).not_to be nil
  end
[-24.756693, -142.579988]

  describe "#reverse_geocode" do
    it "detects Pacific Ocean" do
      true_points = [
        { lng: -142.579988, lat: -24.756693 },
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "area" => 76681173,
          "latitude" => -30.4571931405,
          "longitude" => -82.4547794492,
          "max_x" => 130.111292124,
          "max_y" => 3.39114419316,
          "min_x" => -146.487909061,
          "min_y" => -60,
          "name" => "South Pacific Ocean",
        })
      end
    end

    it "detects South China Sea" do

      true_points = [
        { lng: 121, lat: 25.34 },
        { lng: 109, lat: -2 },
        { lng: 106.875430, lat: -1.150539 }
      ]

      false_points = [
        { lng: 109.709, lat: 19.316 },
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "latitude" => 11.77674997246,
          "longitude" => 112.30802222078,
          "name" => "South China Sea",
          "area" => 3362904,
          "max_x" => 122.15129880188,
          "max_y" => 25.5672843459,
          "min_x" => 102.2384721041,
          "min_y" => -3.22872316783,
        })
      end

      # TODO exclude islands
      false_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "latitude" => 11.77674997246,
          "longitude" => 112.30802222078,
          "name" => "South China Sea",
          "area" => 3362904,
          "max_x" => 122.15129880188,
          "max_y" => 25.5672843459,
          "min_x" => 102.2384721041,
          "min_y" => -3.22872316783,
        })
      end
    end

    it "detects Black Sea" do
      true_points = [
        { lng: 32.875131, lat: 45.958505 }
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "area" => 423026,
          "latitude" => 43.2765240426,
          "longitude" => 34.1751334089,
          "name" => "Black Sea",
          "max_x" => 42.35496044187,
          "max_y" => 47.31029641635,
          "min_x" => 27.44371211572,
          "min_y" => 40.90875351446,
        })
      end
    end

    it "detects Irish Sea and St. George's Channel" do
      true_points = [
        { lng: -2.971340, lat: 54.102678 }
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "area" => 45922,
          "latitude" => 53.4459472219,
          "longitude" => -4.79817510558,
          "max_x" => -2.63917434252,
          "max_y" => 55.00417602071,
          "min_x" => -6.56905257671,
          "min_y" => 51.90413734476,
          "name" => "Irish Sea and St. George's Channel",
        })
      end
    end
  end
end
