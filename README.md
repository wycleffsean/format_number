# FormatNumber

[![Build Status](https://travis-ci.org/wycleffsean/format_number.svg?branch=master)](https://travis-ci.org/wycleffsean/format_number)

A numeric type that is self formatting

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'format_number'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install format_number

## Usage

Use any method from `ActiveSupport::NumberHelper`

```ruby
fn = FormatNumber.new(5, :number_to_currency, unit: '!')
puts fn * 12 # "!60.00"
```

Use with ActiveRecord

```ruby
class Account < ActiveRecord::Base
  serialize :balance, FormatNumber.with(:number_to_currency)
end

puts Account.first.balance # "$100.00"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/format_number. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

