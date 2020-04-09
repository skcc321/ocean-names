lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ocean_names/version"

Gem::Specification.new do |spec|
  spec.name          = "ocean-names"
  spec.version       = OceanNames::VERSION
  spec.authors       = ["rafael"]
  spec.email         = ["skcc321@gmail.com"]

  spec.summary       = %q{reverse geocode oceans/seas names}
  spec.description   = %q{get oceans/seas names from coordinates}
  spec.homepage      = "https://github.com/skcc321/ocean-names"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/skcc321/ocean-names"
  spec.metadata["changelog_uri"] = "https://github.com/skcc321/ocean-names"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oj", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter", "~> 0.4.1"
  spec.add_development_dependency "simplecov", "~> 0.17.1"
  spec.add_development_dependency "pry", "~> 0.12.2"
end
