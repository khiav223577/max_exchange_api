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

## Configuration

### Api timeout time

```rb
MaxExchangeApi.default_config.timeout = 3 # seconds
```

### Api logging

```rb
require 'logger'

MaxExchangeApi.default_config.logger = Logger.new(STDOUT) # print log to stdand output
MaxExchangeApi.default_config.logger = Logger.new('log/api.log')
```

## Usage

### Public Api Examples

```rb
@api = MaxExchangeApi::PublicApi.new
```

#### [GET GET /api/v2/vip_levels](https://max.maicoin.com/documents/api_list#!/public/getApiV2VipLevels)

> Get all VIP level fees.

<details>
  <summary>Show code</summary>
  
```rb
@api.vip_levels
```
</details>

#### [GET /api/v2/vip_levels/{level}](https://max.maicoin.com/documents/api_list#!/public/getApiV2VipLevelsLevel)

> Get VIP level fee by level.

<details>
  <summary>Show code</summary>
  
```rb
@api.vip_levels(2)
```
</details>

#### [GET /api/v2/currencies](https://max.maicoin.com/documents/api_list#!/public/getApiV2Currencies)

> Get all available currencies.

<details>
  <summary>Show code</summary>
  
```rb
@api.currencies
```
</details>

#### [GET /api/v2/k](https://max.maicoin.com/documents/api_list#!/public/getApiV2K)

> Get OHLC(k line) of a specific market.

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api.k('btctwd')

# provide all possible parameters
@api.k('btctwd', limit: 30, period: 1, timestamp: 1624705402)
```
</details>

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

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api.trades('btctwd')

# provide all possible parameters
@api.trades(
  'maxtwd', 
  timestamp: 1624705402,
  from: 68444,
  to: 69444,
  order_by: 'asc',
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/markets](https://max.maicoin.com/documents/api_list#!/public/getApiV2Markets)

> Get all available markets.

<details>
  <summary>Show code</summary>
  
```rb
@api.markets
```
</details>

#### [GET /api/v2/summary](https://max.maicoin.com/documents/api_list#!/public/getApiV2Summary)

> Overview of market data for all tickers.

<details>
  <summary>Show code</summary>
  
```rb
@api.summary
```
</details>

#### [GET /api/v2/tickers/{path_market}](https://max.maicoin.com/documents/api_list#!/public/getApiV2TickersPathMarket)

> Get ticker of specific market.

<details>
  <summary>Show code</summary>
  
```rb
@api.tickers('btctwd')
```
</details>

#### [GET /api/v2/tickers](https://max.maicoin.com/documents/api_list#!/public/getApiV2Tickers)

> Get ticker of all markets.

<details>
  <summary>Show code</summary>
  
```rb
@api.tickers
```
</details>

#### [GET /api/v2/timestamp](https://max.maicoin.com/documents/api_list#!/public/getApiV2Timestamp)

> Get server current time, in seconds since Unix epoch.

<details>
  <summary>Show code</summary>
  
```rb
@api.timestamp
```
</details>

### Private Api Examples

```rb
access_key = 'YOUR_ACCESS_KEY'
secret_key = 'YOUR_SECRET_KEY'

@api = MaxExchangeApi::PrivateApi.new(access_key, secret_key)
```

#### [GET /api/v2/trades/my/of_order](https://max.maicoin.com/documents/api_list#!/private/getApiV2TradesMyOfOrder)

> get your executed trades related to a order

<details>
  <summary>Show code</summary>

```rb
# use max unique order id
@api.my_trades_of_order(123456)

# use user specified order id
@api.my_trades_of_order('MY_ORDER_123456', use_client_id: true)
```
</details>

#### [GET /api/v2/trades/my](https://max.maicoin.com/documents/api_list#!/private/getApiV2TradesMy)

> get your executed trades, sorted in reverse creation order

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.my_trades('btctwd')

# provide all possible parameters
@api.my_trades(
  'maxtwd',
  timestamp: 1624705402,
  from: 68444,
  to: 69444,
  order_by: 'asc',
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/withdrawals](https://max.maicoin.com/documents/api_list#!/private/getApiV2Withdrawals)

> get your external withdrawals history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.withdrawals('max')

# provide all possible parameters
@api.withdrawals(
  'max',
  'confirmed',
  from: 68444,
  to: 69444,
  state: 'confirmed',
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/withdrawal](https://max.maicoin.com/documents/api_list#!/private/getApiV2Withdrawal)

> get details of a specific external withdraw

<details>
  <summary>Show code</summary>

```rb
@api.withdrawal('withdraw_id')
```
</details>

#### [POST /api/v2/withdrawal](https://max.maicoin.com/documents/api_list#!/private/postApiV2Withdrawal)

> submit a withdrawal. IP whitelist for api token is required.

<details>
  <summary>Show code</summary>

```rb
@api.create_withdrawal!('twd', 'withdraw_address_id', 100000)
```
</details>

#### [GET /api/v2/members/profile](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersProfile)

> get personal profile information

<details>
  <summary>Show code</summary>

```rb
@api.member_profile
```
</details>

#### [GET /api/v2/members/me](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersMe)

> get your profile and accounts information

<details>
  <summary>Show code</summary>

```rb
@api.me
```
</details>

#### [GET /api/v2/members/vip_level](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersVipLevel)

> get VIP level info

<details>
  <summary>Show code</summary>

```rb
@api.vip_level
```
</details>

#### [GET /api/v2/members/accounts](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersAccounts)

> get personal accounts information

<details>
  <summary>Show code</summary>

```rb
@api.accounts
```
</details>

#### [GET /api/v2/members/accounts/{path_currency}](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersAccountsPathCurrency)

> get personal accounts information of a currency

<details>
  <summary>Show code</summary>

```rb
@api.account(currnecy)
```
</details>

#### [GET /api/v2/deposits](https://max.maicoin.com/documents/api_list#!/private/getApiV2Deposits)

> get your deposits history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.deposits('max')

# provide all possible parameters
@api.deposits(
  'max',
  'confirmed',
  from: 68444,
  to: 69444,
  state: 'accepted',
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/deposit](https://max.maicoin.com/documents/api_list#!/private/getApiV2Deposit)

> get details of a specific deposit

<details>
  <summary>Show code</summary>

```rb
@api.deposit('transaction_id')
```
</details>

#### [GET /api/v2/deposit_addresses](https://max.maicoin.com/documents/api_list#!/private/getApiV2DepositAddresses)

> The addresses could be empty before generated, please call POST /deposit_addresses in that case

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.deposit_addresses

# provide all possible parameters
@api.deposit_addresses(currency: 'twd', pagination: true, page: 3, limit: 15, offset: 5)
```
</details>

#### [POST /api/v2/deposit_addresses](https://max.maicoin.com/documents/api_list#!/private/postApiV2DepositAddresses)

> Address creation is asynchronous, please call GET /deposit_addresses later to get generated addresses

<details>
  <summary>Show code</summary>

```rb
@api.create_deposit_addresses!('twd')
```
</details>

#### [GET /api/v2/withdraw_addresses](https://max.maicoin.com/documents/api_list#!/private/getApiV2WithdrawAddresses)

> get withdraw addresses

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.withdraw_addresses('twd')

# provide all possible parameters
@api.withdraw_addresses('usdt', pagination: true, page: 3, limit: 15, offset: 5)
```
</details>

#### [GET /api/v2/internal_transfers](https://max.maicoin.com/documents/api_list#!/private/getApiV2InternalTransfers)

> get internal transfers history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.internal_transfers

# provide all possible parameters
@api.internal_transfers(
  currency: 'btc',
  side: 'in',
  from: 68444,
  to: 69444,
  pagination: true, 
  page: 3, 
  limit: 15, 
  offset: 5,
)
```
</details>

#### [GET /api/v2/internal_transfer](https://max.maicoin.com/documents/api_list#!/private/getApiV2InternalTransfer)

> get details of a specific internal transfer

<details>
  <summary>Show code</summary>

```rb
@api.internal_transfer('internal_transfer_id')
```
</details>

#### [GET /api/v2/rewards](https://max.maicoin.com/documents/api_list#!/private/getApiV2Rewards)

> get rewards history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.rewards

# provide all possible parameters
@api.rewards(
  currency: 'btc',
  from: 68444,
  to: 69444,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/rewards/{path_reward_type}](https://max.maicoin.com/documents/api_list#!/private/getApiV2RewardsPathRewardType)

> get specific rewards history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.rewards(reward_type: 'airdrop_rewards')

# provide all possible parameters
@api.rewards(
  reward_type: 'airdrop_rewards',
  currency: 'btc',
  from: 68444,
  to: 69444,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/max_rewards/yesterday](https://max.maicoin.com/documents/api_list#!/private/getApiV2MaxRewardsYesterday)

> get max rewards yesterday

<details>
  <summary>Show code</summary>

```rb
@api.max_rewards_yesterday
```
</details>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/max_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

