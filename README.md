# PlaceKit

Time zone lookup by country, region, and city for those times when latitude/longitude coordinates just aren’t available 🚀

## Installation

Using bundler, add to the `Gemfile`:

```ruby
gem 'place_kit'
```

Or standalone:

```
$ gem install place_kit
```

## Standard Usage

```ruby
require 'place_kit'

PlaceKit.lookup('US', 'CA', 'Los Angeles')

# Case insensitive
PlaceKit.lookup('us', 'CA', 'los Angeles')

# Symbols work too
PlaceKit.lookup(:US, :CA, :Los_Angeles) # Symbols
```
