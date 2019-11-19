RSpec.describe Ocean::Names, :aggregate_failures do
  it "has a version number" do
    expect(Ocean::Names::VERSION).not_to be nil
  end

  describe "#reverse_geocode" do
    it "detects South China Sea" do

      true_points = [
        { lat: 121, lng: 25.34 },
        { lat: 109, lng: -2 },
      ]

      false_points = [
        { lat: 109.709, lng: 19.316 },
      ]

      true_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "ID" => "49",
          "Latitude" => 11.77674997246,
          "Longitude" => 112.30802222078,
          "MRGID" => 4332,
          "NAME" => "South China Sea",
          "area" => 3362904,
          "max_X" => 122.15129880188,
          "max_Y" => 25.5672843459,
          "min_X" => 102.2384721041,
          "min_Y" => -3.22872316783,
        })
      end

      false_points.each do |point|
        expect(described_class.reverse_geocode(point)).to eq({
          "ID" => "49",
          "Latitude" => 11.77674997246,
          "Longitude" => 112.30802222078,
          "MRGID" => 4332,
          "NAME" => "South China Sea",
          "area" => 3362904,
          "max_X" => 122.15129880188,
          "max_Y" => 25.5672843459,
          "min_X" => 102.2384721041,
          "min_Y" => -3.22872316783,
        })
      end
    end
  end
end
