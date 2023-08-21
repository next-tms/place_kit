# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip.freeze

Gem::Specification.new do |spec|
  spec.name = 'place_kit'
  spec.version = version

  spec.authors = 'Third Party Transportation Systems LLC'
  spec.email = 'hello@next-tms.com'

  spec.description = <<~DESCRIPTION.gsub("\n", '')
    Time zone lookup by country, region, and city for those times when latitude/longitude coordinates just aren’t
    available 🚀
  DESCRIPTION
  spec.homepage = 'https://github.com/next-tms/place_kit'
  spec.summary = 'Time zone lookup by country, region, and city 🚀'

  spec.files = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 6.0.0', '< 7.1'
  spec.add_dependency 'fastcsv', '~> 0.0.6'

  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rubocop-next', '~> 1.0.4'

  spec.required_ruby_version = '>= 3.2.0'
end
