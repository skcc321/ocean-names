# frozen_string_literal: true

require "spec_helper"

RSpec.describe OceanNames, :aggregate_failures do
  it "has a version number" do
    expect(OceanNames::VERSION).not_to be nil
  end

  describe "#reverse_geocode" do
    it "detects Pacific Ocean" do
      true_points = [
        { lng: -142.579988, lat: -24.756693 },
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(**point)).to eq({
          "area" => 76681173,
          "lat" => -30.4571931405,
          "lng" => -82.4547794492,
          "max_lat" => 3.39114419316023,
          "max_lng" => 180.0,
          "min_lat" => -59.99999999999988,
          "min_lng" => -180.0,
          "name" => "South Pacific Ocean",
        })
      end
    end

    it "detects Pacific Ocean" do
      true_points = [
        { lng: 140.974083, lat: 33.712128 },
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(**point)).to eq({
          "area" => 65154681,
          "lat" => 23.9623940894,
          "lng" => -40.1574405109,
          "max_lat" => 58.211545022054,
          "max_lng" => 180.0,
          "min_lat" => 2.0973921512992298e-11,
          "min_lng" => -180,
          "name" => "North Pacific Ocean",
        })
      end
    end

    it "detects South China Sea" do
      true_points = [
        { lng: 121, lat: 25.34 },
        { lng: 109, lat: -2 },
        { lng: 106.875430, lat: -1.150539 }
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(**point)).to eq({
          "area" => 3362904,
          "lat" => 11.77674997246,
          "lng" => 112.30802222078,
          "max_lat" => 25.5278412105036,
          "max_lng" => 122.151298801884,
          "min_lat" => -3.22872316782812,
          "min_lng" => 102.238472104104,
          "name" => "South China Sea",
        })
      end
    end

    it "detects Black Sea" do
      true_points = [
        { lng: 32.875131, lat: 45.958505 }
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(**point)).to eq({
          "area" => 423026,
          "lat" => 43.2765240426,
          "lng" => 34.1751334089,
          "max_lat" => 47.0198968650484,
          "max_lng" => 41.7782796622767,
          "min_lat" => 40.9095925090871,
          "min_lng" => 27.4464802739456,
          "name" => "Black Sea",
        })
      end
    end

    it "detects Irish Sea and St. George's Channel" do
      true_points = [
        { lng: -2.971340, lat: 54.102678 }
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(**point)).to eq({
          "area" => 45922,
          "lat" => 53.4459472219,
          "lng" => -4.79817510558,
          "max_lat" => 54.9867891074314,
          "max_lng" => -2.75243687656052,
          "min_lat" => 51.9041373447589,
          "min_lng" => -6.46759235850053,
          "name" => "Irish Sea and St. George's Channel",
        })
      end
    end
  end
end
