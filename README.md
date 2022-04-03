# Spacetime

Time zone lookup by country, region, and city for those times when latitude/longitude coordinates just aren’t available 🚀

## Installation

Using bundler, add to the `Gemfile`:

```ruby
gem 'spacetime'
```

Or standalone:

```
$ gem install spacetime
```

## Standard Usage

```ruby
require 'spacetime'

Spacetime.lookup('US', 'CA', 'Los Angeles')

# Case insensitive
Spacetime.lookup('us', 'CA', 'los Angeles')

# Symbols work too
Spacetime.lookup(:US, :CA, :Los_Angeles) # Symbols
```
