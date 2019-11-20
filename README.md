# Ocean::Names

Simple reverse geocoder for oceans/seas.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocean-names'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocean-names

## Usage

```ruby
2.6.5 :001 > require "ocean/names"
 => true 
2.6.5 :002 > Ocean::Names.reverse_geocode(lat: 0, lng: 0)
 => {"NAME"=>"South Atlantic Ocean", "ID"=>"32", "Longitude"=>-18.80876715914, "Latitude"=>-33.73239551445, "min_X"=>-69.60083675371, "min_Y"=>-60, "max_X"=>20.00904913827, "max_Y"=>0.07510554798, "area"=>40501812, "MRGID"=>1914} 
2.6.5 :003 > Ocean::Names.reverse_geocode(lat: -18, lng: -33)
 => {"NAME"=>"South Atlantic Ocean", "ID"=>"32", "Longitude"=>-18.80876715914, "Latitude"=>-33.73239551445, "min_X"=>-69.60083675371, "min_Y"=>-60, "max_X"=>20.00904913827, "max_Y"=>0.07510554798, "area"=>40501812, "MRGID"=>1914} 
2.6.5 :004 > Ocean::Names.reverse_geocode(lat: 79, lng: -32)
 => {"NAME"=>"Indian Ocean", "ID"=>"45", "Longitude"=>79.20858601429, "Latitude"=>-32.72458381046, "min_X"=>20.00261595272, "min_Y"=>-60, "max_X"=>146.8982192222, "max_Y"=>10.44499945636, "area"=>58230954, "MRGID"=>1904} 
2.6.5 :005 > Ocean::Names.reverse_geocode(lat: 135, lng: -40)
 => {"NAME"=>"Great Australian Bight", "ID"=>"62", "Longitude"=>132.7165581317, "Latitude"=>-36.72591576597, "min_X"=>117.6141982382, "min_Y"=>-43.56601647135, "max_X"=>146.23115575344, "max_Y"=>-31.46366941901, "area"=>1326209, "MRGID"=>4276} 
2.6.5 :006 > Ocean::Names.reverse_geocode(lat: 135, lng: 40)
 => {"NAME"=>"Japan Sea", "ID"=>"52", "Longitude"=>135.13274500727, "Latitude"=>40.5084302428, "min_X"=>125.8013889, "min_Y"=>32.57501368363, "max_X"=>142.2638347153, "max_Y"=>51.74733316939, "area"=>1066307, "MRGID"=>4307} 
2.6.5 :007 > Ocean::Names.reverse_geocode(lat: 125, lng: 29)
 => {"NAME"=>"Eastern China Sea", "ID"=>"50", "Longitude"=>125.21708986497, "Latitude"=>29.13089135213, "min_X"=>118.47804582106, "min_Y"=>24.05760752069, "max_X"=>131.1322036827, "max_Y"=>33.37195920955, "area"=>761356, "MRGID"=>4302} 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ocean-names. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ocean::Names project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ocean-names/blob/master/CODE_OF_CONDUCT.md).
