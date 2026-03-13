# MAX Exchange API Ruby SDK

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
- Ruby 2.2 ~ 2.7, 3.0 ~ 3.3

## Table of contents

<!-- TOC -->
* [MAX Exchange API Ruby SDK](#max-exchange-api-ruby-sdk)
  * [Documentations](#documentations)
  * [Supports](#supports)
  * [Table of contents](#table-of-contents)
  * [Installation](#installation)
  * [Configuration](#configuration)
    * [Set timeout time](#set-timeout-time)
    * [Logging](#logging)
  * [Usage](#usage)
  * [Public Api Examples](#public-api-examples)
      * [GET /api/v2/vip_levels](#get-apiv2vip_levels)
      * [GET /api/v2/vip_levels/{level}](#get-apiv2vip_levelslevel)
      * [GET /api/v2/currencies](#get-apiv2currencies)
      * [GET /api/v2/k](#get-apiv2k)
      * [GET /api/v2/depth](#get-apiv2depth)
      * [GET /api/v2/trades](#get-apiv2trades)
      * [GET /api/v2/markets](#get-apiv2markets)
      * [GET /api/v2/summary](#get-apiv2summary)
      * [GET /api/v2/tickers/{path_market}](#get-apiv2tickerspath_market)
      * [GET /api/v2/tickers](#get-apiv2tickers)
      * [GET /api/v2/timestamp](#get-apiv2timestamp)
      * [GET /api/v3/wallet/m/limits](#get-apiv3walletmlimits)
  * [Private Api Examples](#private-api-examples)
    * [User](#user)
      * [GET /api/v2/members/profile](#get-apiv2membersprofile)
      * [GET /api/v2/members/me](#get-apiv2membersme)
      * [GET /api/v2/members/vip_level](#get-apiv2membersvip_level)
    * [Account](#account)
      * [GET /api/v2/members/accounts](#get-apiv2membersaccounts)
      * [GET /api/v2/members/accounts/{path_currency}](#get-apiv2membersaccountspath_currency)
    * [Order](#order)
      * [GET /api/v2/orders](#get-apiv2orders)
      * [GET /api/v2/order](#get-apiv2order)
      * [POST /api/v2/orders/clear](#post-apiv2ordersclear)
      * [POST /api/v2/order/delete](#post-apiv2orderdelete)
      * [POST /api/v2/orders](#post-apiv2orders)
      * [POST /api/v2/orders/multi/onebyone](#post-apiv2ordersmultionebyone)
    * [Trade](#trade)
      * [GET /api/v2/trades/my/of_order](#get-apiv2tradesmyof_order)
      * [GET /api/v2/trades/my](#get-apiv2tradesmy)
    * [Deposit](#deposit)
      * [GET /api/v2/deposits](#get-apiv2deposits)
      * [GET /api/v2/deposit](#get-apiv2deposit)
      * [GET /api/v2/deposit_addresses](#get-apiv2deposit_addresses)
      * [POST /api/v2/deposit_addresses](#post-apiv2deposit_addresses)
    * [Withdrawal](#withdrawal)
      * [GET /api/v2/withdrawals](#get-apiv2withdrawals)
      * [GET /api/v2/withdrawal](#get-apiv2withdrawal)
      * [POST /api/v2/withdrawal](#post-apiv2withdrawal)
      * [GET /api/v2/withdraw_addresses](#get-apiv2withdraw_addresses)
    * [Internal Transfer](#internal-transfer)
      * [GET /api/v2/internal_transfers](#get-apiv2internal_transfers)
      * [GET /api/v2/internal_transfer](#get-apiv2internal_transfer)
    * [Reward](#reward)
      * [GET /api/v2/rewards](#get-apiv2rewards)
      * [GET /api/v2/rewards/{path_reward_type}](#get-apiv2rewardspath_reward_type)
      * [GET /api/v2/max_rewards/yesterday](#get-apiv2max_rewardsyesterday)
      * [GET /api/v2/yields](#get-apiv2yields)
  * [Development](#development)
  * [Contributing](#contributing)
  * [License](#license)
<!-- TOC -->

## Installation

```ruby
gem 'max_exchange_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install max_exchange_api

## Configuration

### Set timeout time

```rb
# Set default timeout time
MaxExchangeApi.default_config.timeout = 3 # seconds

# Create an api instance with custom timeout time
api = MaxExchangeApi::PublicV3Api.new(config: { timeout: 12 })
api = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key, config: { timeout: 12 })
```

### Logging

```rb
require 'logger'

# Print log to standard output
MaxExchangeApi.default_config.logger = Logger.new(STDOUT)

# Print log to file
MaxExchangeApi.default_config.logger = Logger.new('log/api.log')

# Create an api instance with custom logger
api = MaxExchangeApi::PublicV3Api.new(config: { logger: Logger.new(STDOUT) })
api = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key, config: { logger: Logger.new(STDOUT) })
```

## Usage

```rb
@public_api = MaxExchangeApi::PublicV2Api.new
@public_api.depth('usdttwd')

access_key, secret_key = File.read('secret').split(',')
@private_api = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key)
@private_api.create_order!('usdttwd', 'sell', 1000, price: 31.35)
@private_api.create_order!('usdttwd', 'buy', 1000, price: 31.15)
```

## Public Api Examples

```rb
@api_v2 = MaxExchangeApi::PublicV2Api.new
@api_v3 = MaxExchangeApi::PublicV3Api.new
```

#### [GET /api/v2/vip_levels](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevels)

> Get all VIP level fees.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.vip_levels
```
</details>

#### [GET /api/v2/vip_levels/{level}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevelsLevel)

> Get VIP level fee by level.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.vip_levels(2)
```
</details>

#### [GET /api/v2/currencies](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Currencies)

> Get all available currencies.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.currencies
```
</details>

#### [GET /api/v2/k](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2K)

> Get OHLC(k line) of a specific market.

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api_v2.k('btctwd')

# provide all possible parameters
@api_v2.k('btctwd', limit: 30, period: 1, timestamp: 1624705402)
```
</details>

#### [GET /api/v2/depth](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Depth)

> Get depth of a specified market.

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api_v2.depth('maxtwd')

# provide all possible parameters
@api_v2.depth('maxtwd', limit: 10, sort_by_price: true)
```
</details>

#### [GET /api/v2/trades](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Trades)

> Get recent trades on market, sorted in reverse creation order.

<details>
  <summary>Show code</summary>
  
```rb
# use default parameters
@api_v2.trades('btctwd')

# provide all possible parameters
@api_v2.trades(
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

#### [GET /api/v2/markets](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Markets)

> Get all available markets.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.markets
```
</details>

#### [GET /api/v2/summary](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Summary)

> Overview of market data for all tickers.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.summary
```
</details>

#### [GET /api/v2/tickers/{path_market}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2TickersPathMarket)

> Get ticker of specific market.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.tickers('btctwd')
```
</details>

#### [GET /api/v2/tickers](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Tickers)

> Get ticker of all markets.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.tickers
```
</details>

#### [GET /api/v2/timestamp](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Timestamp)

> Get server current time, in seconds since Unix epoch.

<details>
  <summary>Show code</summary>
  
```rb
@api_v2.timestamp
```
</details>

#### [GET /api/v3/wallet/m/limits](https://max.maicoin.com/documents/api_list/v3#tag/Public/operation/getApiV3WalletMLimits)

> Get total available loan amount

<details>
  <summary>Show code</summary>
  
```rb
@api_v3.available_loan_amount
```
</details>

---

## Private Api Examples

```rb
access_key = 'YOUR_ACCESS_KEY'
secret_key = 'YOUR_SECRET_KEY'

@api_v2 = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key)
@api_v3 = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key)
```

### User
#### [GET /api/v2/members/profile](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersProfile)

> get personal profile information

<details>
  <summary>Show code</summary>

```rb
@api_v2.member_profile
```
</details>

#### [GET /api/v2/members/me](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersMe)

> get your profile and accounts information

<details>
  <summary>Show code</summary>

```rb
@api_v2.me
```
</details>

#### [GET /api/v2/members/vip_level](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersVipLevel)

> get VIP level info

<details>
  <summary>Show code</summary>

```rb
@api_v2.vip_level
```
</details>

### Account
#### [GET /api/v2/members/accounts](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersAccounts)

> get personal accounts information

<details>
  <summary>Show code</summary>

```rb
@api_v2.accounts
```
</details>

#### [GET /api/v2/members/accounts/{path_currency}](https://max.maicoin.com/documents/api_list#!/private/getApiV2MembersAccountsPathCurrency)

> get personal accounts information of a currency

<details>
  <summary>Show code</summary>

```rb
@api_v2.account(currnecy)
```
</details>

### Order
#### [GET /api/v2/orders](https://max.maicoin.com/documents/api_list#!/private/getApiV2Orders)

> get your orders, results is paginated.

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.orders('maxtwd')

# provide all possible parameters
@api.orders(
  'maxtwd',
  state: 'done',
  order_by: 'desc',
  group_id: 12345,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

#### [GET /api/v2/order](https://max.maicoin.com/documents/api_list#!/private/getApiV2Order)

> get a specific order.

<details>
  <summary>Show code</summary>

```rb
# use max unique order id
@api.order(123456)

# use user specified order id
@api.order('MY_ORDER_123456', use_client_id: true)
```
</details>

#### [POST /api/v2/orders/clear](https://max.maicoin.com/documents/api_list#!/private/postApiV2OrdersClear)

> cancel all your orders with given market and side

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.cancel_orders!

# provide all possible parameters
@api.cancel_orders!(market: 'maxtwd', side: 'sell', group_id: '123456')
```
</details>

#### [POST /api/v2/order/delete](https://max.maicoin.com/documents/api_list#!/private/postApiV2OrderDelete)

> cancel an order

<details>
  <summary>Show code</summary>

```rb
# use max unique order id
@api.cancel_order!(123456)

# use user specified order id
@api.cancel_order!('MY_ORDER_123456', use_client_id: true)
```
</details>

#### [POST /api/v2/orders](https://max.maicoin.com/documents/api_list#!/private/postApiV2Orders)

> create a sell/buy order

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.create_order!('maxtwd', 'buy', 1000, price: 7.5)

# provide all possible parameters
@api.create_order!(
  'maxtwd',
  'buy',
  1000,
  price: 7.5,
  client_oid: 'MY_ORDER_ID_12345',
  stop_price: 8,
  ord_type: 'limit',
  group_id: 12345678,
)
```
</details>

#### [POST /api/v2/orders/multi/onebyone](https://max.maicoin.com/documents/api_list#!/private/postApiV2OrdersMultiOnebyone)

> Create multiple sell/buy orders, orders may be partially accepted, please put your orders as an array in json body.

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.create_orders!('maxtwd', [
  { side: 'buy', volume: '1000', price: '7.5' },
  { side: 'buy', volume: '1500', price: '7.2' },
])

# provide all possible parameters
@api.create_orders!('maxtwd', [
  { side: 'buy', volume: '1000', price: '7.5', client_oid: 'MY_ORDER_ID_12345', stop_price: '8', ord_type: 'limit' },
  { side: 'buy', volume: '1500', price: '7.2', client_oid: 'MY_ORDER_ID_12346', stop_price: '8', ord_type: 'limit' },
], group_id: 12345)
```
</details>

### Trade
#### [GET /api/v2/trades/my/of_order](https://max.maicoin.com/documents/api_list#!/private/getApiV2TradesMyOfOrder)

> get your executed trades related to a order

<details>
  <summary>Show code</summary>

```rb
# use max unique order id
@api_v2.my_trades_of_order(123456)

# use user specified order id
@api_v2.my_trades_of_order('MY_ORDER_123456', use_client_id: true)
```
</details>

#### [GET /api/v2/trades/my](https://max.maicoin.com/documents/api_list#!/private/getApiV2TradesMy)

> get your executed trades, sorted in reverse creation order

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.my_trades('btctwd')

# provide all possible parameters
@api_v2.my_trades(
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

### Deposit
#### [GET /api/v2/deposits](https://max.maicoin.com/documents/api_list#!/private/getApiV2Deposits)

> get your deposits history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.deposits('max')

# provide all possible parameters
@api_v2.deposits(
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
@api_v2.deposit('transaction_id')
```
</details>

#### [GET /api/v2/deposit_addresses](https://max.maicoin.com/documents/api_list#!/private/getApiV2DepositAddresses)

> The addresses could be empty before generated, please call POST /deposit_addresses in that case

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.deposit_addresses

# provide all possible parameters
@api_v2.deposit_addresses(currency: 'twd', pagination: true, page: 3, limit: 15, offset: 5)
```
</details>

#### [POST /api/v2/deposit_addresses](https://max.maicoin.com/documents/api_list#!/private/postApiV2DepositAddresses)

> Address creation is asynchronous, please call GET /deposit_addresses later to get generated addresses

<details>
  <summary>Show code</summary>

```rb
@api_v2.create_deposit_addresses!('twd')
```
</details>

### Withdrawal
#### [GET /api/v2/withdrawals](https://max.maicoin.com/documents/api_list#!/private/getApiV2Withdrawals)

> get your external withdrawals history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.withdrawals('max')

# provide all possible parameters
@api_v2.withdrawals(
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
@api_v2.withdrawal('withdraw_id')
```
</details>

#### [POST /api/v2/withdrawal](https://max.maicoin.com/documents/api_list#!/private/postApiV2Withdrawal)

> submit a withdrawal. IP whitelist for api token is required.

<details>
  <summary>Show code</summary>

```rb
@api_v2.create_withdrawal!('twd', 'withdraw_address_id', 100000)
```
</details>

#### [GET /api/v2/withdraw_addresses](https://max.maicoin.com/documents/api_list#!/private/getApiV2WithdrawAddresses)

> get withdraw addresses

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.withdraw_addresses('twd')

# provide all possible parameters
@api_v2.withdraw_addresses('usdt', pagination: true, page: 3, limit: 15, offset: 5)
```
</details>

### Internal Transfer
#### [GET /api/v2/internal_transfers](https://max.maicoin.com/documents/api_list#!/private/getApiV2InternalTransfers)

> get internal transfers history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.internal_transfers

# provide all possible parameters
@api_v2.internal_transfers(
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
@api_v2.internal_transfer('internal_transfer_id')
```
</details>

### Reward
#### [GET /api/v2/rewards](https://max.maicoin.com/documents/api_list#!/private/getApiV2Rewards)

> get rewards history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.rewards

# provide all possible parameters
@api_v2.rewards(
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
@api_v2.rewards(reward_type: 'airdrop_rewards')

# provide all possible parameters
@api_v2.rewards(
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
@api_v2.max_rewards_yesterday
```
</details>

#### [GET /api/v2/yields](https://max.maicoin.com/documents/api_list#!/private/getApiV2Yields)

> get yields history

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api_v2.yields

# provide all possible parameters
@api_v2.yields(
  currency: 'usdt',
  from: 68444,
  to: 69444,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```
</details>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/max_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

