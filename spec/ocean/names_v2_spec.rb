RSpec.describe Ocean::Names::V2 do
  it "works even with yml data" do
    expect(described_class.reverse_geocode(lat: 121, lng: 25.34)).to eq({
      "ID" => "45",
      "Latitude" => -32.72458381046,
      "Longitude" => 79.20858601429,
      "MRGID" => 1904,
      "NAME" => "Indian Ocean",
      "area" => 58230954,
      "max_X" => 146.8982192222,
      "max_Y" => 10.44499945636,
      "min_X" => 20.00261595272,
      "min_Y" => -60.0,
    })
  end
end
