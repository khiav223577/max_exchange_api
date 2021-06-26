# MaxExchangeApi

[![Gem Version](https://img.shields.io/gem/v/max_exchange_api.svg?style=flat)](http://rubygems.org/gems/max_exchange_api)
[![Build Status](https://github.com/khiav223577/max_exchange_api/workflows/Ruby/badge.svg)](https://github.com/khiav223577/max_exchange_api/actions)
[![RubyGems](http://img.shields.io/gem/dt/max_exchange_api.svg?style=flat)](http://rubygems.org/gems/max_exchange_api)
[![Code Climate](https://codeclimate.com/github/khiav223577/max_exchange_api/badges/gpa.svg)](https://codeclimate.com/github/khiav223577/max_exchange_api)
[![Test Coverage](https://codeclimate.com/github/khiav223577/max_exchange_api/badges/coverage.svg)](https://codeclimate.com/github/khiav223577/max_exchange_api/coverage)

A ruby implementation of MAX exchange API

* REST API V2
* Websocket API

## Documentations

* [REST API Introduction](https://max.maicoin.com/documents/api_v2)
* [REST API End Points](https://max.maicoin.com/documents/api_list)
* [WebSocket API Documentation](https://maicoin.github.io/max-websocket-docs/)


## Supports
- Ruby 2.2 ~ 2.7

## Installation

```ruby
gem 'max_exchange_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install max_exchange_api

## Default config

Change default api timeout time (in seconds)

```rb
MaxExchangeApi.config.default_timeout = 3
```

## Usage

### Public Api Examples

```rb
@api = MaxExchangeApi::PublicApi.new
```

#### [GET GET /api/v2/vip_levels](https://max.maicoin.com/documents/api_list#!/public/getApiV2VipLevels)

> Get all VIP level fees.

(Coming soon)

#### [GET /api/v2/vip_levels/{level}](https://max.maicoin.com/documents/api_list#!/public/getApiV2VipLevelsLevel)

> Get VIP level fee by level.

(Coming soon)

#### [GET /api/v2/currencies](https://max.maicoin.com/documents/api_list#!/public/getApiV2Currencies)

> Get all available currencies.

(Coming soon)

#### [GET /api/v2/k](https://max.maicoin.com/documents/api_list#!/public/getApiV2K)

> Get OHLC(k line) of a specific market.

(Coming soon)

#### [GET /api/v2/depth](https://max.maicoin.com/documents/api_list#!/public/getApiV2Depth)

> Get depth of a specified market.

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api.depth('maxtwd')

# provide all possible parameters
@api.depth('maxtwd', limit: 10, sort_by_price: true)
```
</details>

#### [GET /api/v2/trades](https://max.maicoin.com/documents/api_list#!/public/getApiV2Trades)

> Get recent trades on market, sorted in reverse creation order.

(Coming soon)

#### [GET /api/v2/markets](https://max.maicoin.com/documents/api_list#!/public/getApiV2Markets)

> Get all available markets.

(Coming soon)

#### [GET /api/v2/summary](https://max.maicoin.com/documents/api_list#!/public/getApiV2Summary)

> Overview of market data for all tickers.

(Coming soon)

#### [GET /api/v2/tickers/{path_market}](https://max.maicoin.com/documents/api_list#!/public/getApiV2TickersPathMarket)

> Get ticker of specific market.

(Coming soon)

#### [GET /api/v2/tickers](https://max.maicoin.com/documents/api_list#!/public/getApiV2Tickers)

> Get ticker of all markets.

(Coming soon)

#### [GET /api/v2/timestamp](https://max.maicoin.com/documents/api_list#!/public/getApiV2Timestamp)

> Get server current time, in seconds since Unix epoch.

(Coming soon)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/max_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

