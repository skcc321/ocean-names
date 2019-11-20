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
 => {"name"=>"South Atlantic Ocean", "longitude"=>-18.80876715914, "latitude"=>-33.73239551445, "min_x"=>-69.60083675371, "min_y"=>-60, "max_x"=>20.00904913827, "max_y"=>0.07510554798, "area"=>40501812}
2.6.5 :003 > Ocean::Names.reverse_geocode(lat: -18, lng: -33)
 => {"name"=>"South Atlantic Ocean", "longitude"=>-18.80876715914, "latitude"=>-33.73239551445, "min_x"=>-69.60083675371, "min_y"=>-60, "max_x"=>20.00904913827, "max_y"=>0.07510554798, "area"=>40501812}
2.6.5 :004 > Ocean::Names.reverse_geocode(lat: 79, lng: -32)
 => {"name"=>"Indian Ocean", "longitude"=>79.20858601429, "latitude"=>-32.72458381046, "min_x"=>20.00261595272, "min_y"=>-60, "max_x"=>146.8982192222, "max_y"=>10.44499945636, "area"=>58230954}
2.6.5 :005 > Ocean::Names.reverse_geocode(lat: 135, lng: -40)
 => {"name"=>"Great Australian Bight", "longitude"=>132.7165581317, "latitude"=>-36.72591576597, "min_x"=>117.6141982382, "min_y"=>-43.56601647135, "max_x"=>146.23115575344, "max_y"=>-31.46366941901, "area"=>1326209}
2.6.5 :006 > Ocean::Names.reverse_geocode(lat: 135, lng: 40)
 => {"name"=>"Japan Sea", "longitude"=>135.13274500727, "latitude"=>40.5084302428, "min_x"=>125.8013889, "min_y"=>32.57501368363, "max_x"=>142.2638347153, "max_y"=>51.74733316939, "area"=>1066307}
2.6.5 :007 > Ocean::Names.reverse_geocode(lat: 125, lng: 29)
 => {"name"=>"Eastern China Sea", "longitude"=>125.21708986497, "latitude"=>29.13089135213, "min_x"=>118.47804582106, "min_y"=>24.05760752069, "max_x"=>131.1322036827, "max_y"=>33.37195920955, "area"=>761356}
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
