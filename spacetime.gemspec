# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'spacetime/version'

Gem::Specification.new do |spec|
  spec.name = 'spacetime'
  spec.version = Spacetime::VERSION
  spec.date = '2022-04-02'

  spec.authors = ['Third Party Transportation Systems LLC']
  spec.email = ['hello@next-tms.com']

  spec.summary = 'Time zone lookup by country, region, and city 🚀'
  spec.description = 'Time zone lookup by country, region, and city for those times when latitude/longitude coordinates just aren’t available 🚀'

  spec.homepage = 'https://github.com/next-tms/spacetime'

  spec.files = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 6.0.0', '< 7.1'
  spec.add_dependency 'fastcsv', '~> 0.0.6'
end
