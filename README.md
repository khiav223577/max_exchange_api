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
* [MAX V3 RESTful API List](https://max-api.maicoin.com/doc/v3.html)
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
  * [Usage](#usage)
  * [Configuration](#configuration)
    * [Set timeout time](#set-timeout-time)
    * [Logging](#logging)
  * [Public V3 Api Examples](#public-v3-api-examples)
      * [GET /api/v3/wallet/m/index_prices](#get-apiv3walletmindex_prices)
      * [GET /api/v3/wallet/m/historical_index_prices](#get-apiv3walletmhistorical_index_prices)
      * [GET /api/v3/wallet/m/limits](#get-apiv3walletmlimits)
      * [GET /api/v3/wallet/m/interest_rates](#get-apiv3walletminterest_rates)
      * [GET /api/v3/markets](#get-apiv3markets)
      * [GET /api/v3/currencies](#get-apiv3currencies)
      * [GET /api/v3/timestamp](#get-apiv3timestamp)
      * [GET /api/v3/k](#get-apiv3k)
      * [GET /api/v3/depth](#get-apiv3depth)
      * [GET /api/v3/trades](#get-apiv3trades)
      * [GET /api/v3/tickers](#get-apiv3tickers)
      * [GET /api/v3/ticker](#get-apiv3ticker)
  * [Private V3 Api Examples](#private-v3-api-examples)
    * [User](#user)
      * [GET /api/v3/info](#get-apiv3info)
    * [Account](#account)
      * [GET api/v3/wallet/{wallet_type}/accounts](#get-apiv3walletwallet_typeaccounts)
    * [M-Wallet](#m-wallet)
      * [GET api/v3/wallet/m/ad_ratio](#get-apiv3walletmad_ratio)
      * [POST api/v3/wallet/m/loan](#post-apiv3walletmloan)
      * [POST api/v3/wallet/m/repayment](#post-apiv3walletmrepayment)
      * [GET api/v3/wallet/m/loans](#get-apiv3walletmloans)
      * [GET api/v3/wallet/m/repayments](#get-apiv3walletmrepayments)
      * [GET api/v3/wallet/m/liquidations](#get-apiv3walletmliquidations)
      * [GET api/v3/wallet/m/liquidation](#get-apiv3walletmliquidation)
      * [GET api/v3/wallet/m/interests](#get-apiv3walletminterests)
    * [Convert](#convert)
      * [GET /api/v3/converts](#get-apiv3converts)
      * [GET /api/v3/convert](#get-apiv3convert)
      * [POST /api/v3/convert](#post-apiv3convert)
    * [Order](#order)
      * [GET /api/v3/wallet/{wallet_type}/orders/open](#get-apiv3walletwallet_typeordersopen)
      * [GET /api/v3/wallet/{wallet_type}/orders/closed](#get-apiv3walletwallet_typeordersclosed)
      * [GET /api/v3/wallet/{wallet_type}/orders/history](#get-apiv3walletwallet_typeordershistory)
      * [POST /api/v3/wallet/{wallet_type}/order](#post-apiv3walletwallet_typeorder)
      * [GET /api/v3/order](#get-apiv3order)
      * [DELETE /api/v3/wallet/{wallet_type}/order](#delete-apiv3walletwallet_typeorder)
      * [DELETE /api/v3/order](#delete-apiv3order)
  * [Public V2 Api Examples](#public-v2-api-examples)
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
    * [Deposit](#deposit)
      * [GET /api/v3/deposit_address](#get-apiv3deposit_address)
      * [GET /api/v3/deposits](#get-apiv3deposits)
      * [GET /api/v3/deposit](#get-apiv3deposit)
  * [Private V2 Api Examples](#private-v2-api-examples)
    * [User](#user-1)
      * [GET /api/v2/members/profile](#get-apiv2membersprofile)
      * [GET /api/v2/members/me](#get-apiv2membersme)
      * [GET /api/v2/members/vip_level](#get-apiv2membersvip_level)
    * [Account](#account-1)
      * [GET /api/v2/members/accounts](#get-apiv2membersaccounts)
      * [GET /api/v2/members/accounts/{path_currency}](#get-apiv2membersaccountspath_currency)
    * [Order](#order-1)
      * [GET /api/v2/orders](#get-apiv2orders)
      * [GET /api/v2/order](#get-apiv2order)
      * [POST /api/v2/orders/clear](#post-apiv2ordersclear)
      * [POST /api/v2/order/delete](#post-apiv2orderdelete)
      * [POST /api/v2/orders](#post-apiv2orders)
      * [POST /api/v2/orders/multi/onebyone](#post-apiv2ordersmultionebyone)
    * [Trade](#trade)
      * [GET /api/v2/trades/my/of_order](#get-apiv2tradesmyof_order)
      * [GET /api/v2/trades/my](#get-apiv2tradesmy)
    * [Deposit](#deposit-1)
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

## Usage

```rb
@public_v3_api = MaxExchangeApi::PublicV3Api.new
@public_v3_api.depth('usdttwd')

access_key, secret_key = File.read('secret').split(',')
@private_v3_api = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key)
@private_v3_api.create_order!('usdttwd', 'sell', 1000, price: 31.35)
@private_v3_api.create_order!('usdttwd', 'buy', 1000, price: 31.15)
```

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

## Public V3 Api Examples

```rb
@public_v3_api = MaxExchangeApi::PublicV3Api.new
```

#### [GET /api/v3/wallet/m/index_prices](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3WalletMIndexPrices)

> Get latest index prices of m-wallet

```rb
@public_v3_api.index_prices
```

#### [GET /api/v3/wallet/m/historical_index_prices](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3WalletMHistoricalIndexPrices)

> Get latest historical index prices

```rb
@public_v3_api.index_prices_histories
```

#### [GET /api/v3/wallet/m/limits](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3WalletMLimits)

> Get total available loan amount

```rb
@public_v3_api.available_loan_amount
```

#### [GET /api/v3/wallet/m/interest_rates](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3WalletMInterestRates)

> Get latest interest rates of m-wallet

```rb
@public_v3_api.loan_interest_rates
```

#### [GET /api/v3/markets](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Markets)

> Get all available markets.

```rb
@public_v3_api.markets
```

#### [GET /api/v3/currencies](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Currencies)

> Get all available currencies

```rb
@public_v3_api.currencies
```

#### [GET /api/v3/timestamp](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Timestamp)

> Get server current time, in seconds since Unix epoch

```rb
@public_v3_api.timestamp
```

#### [GET /api/v3/k](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3K)

> Get OHLC(k line) of a specific market.

```rb
# use default parameters
@private_v3_api.k('btctwd')

# provide all possible parameters
@private_v3_api.k('btctwd', limit: 30, period: 1, timestamp: 1624705402)
```

#### [GET /api/v3/depth](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Depth)

> Get depth of a specified market.

```rb
# use default parameters
@private_v3_api.depth('maxtwd')

# provide all possible parameters
@private_v3_api.depth('maxtwd', limit: 10, sort_by_price: true)
```

#### [GET /api/v3/trades](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Trades)

> Get recent trades on market, sorted in reverse creation order.

```rb
# use default parameters
@private_v3_api.trades('btctwd')

# provide all possible parameters
@private_v3_api.trades(
  'maxtwd', 
  timestamp: 1624705402,
  limit: 15,
)
```

#### [GET /api/v3/tickers](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Tickers)

> Get ticker of all markets.

```rb
@private_v3_api.tickers
```

#### [GET /api/v3/ticker](https://max-api.maicoin.com/doc/v3.html#tag/Public/operation/getApiV3Ticker)

> Get ticker of specific market.

```rb
@private_v3_api.ticker('btctwd')
```

---

## Private V3 Api Examples

```rb
access_key = 'YOUR_ACCESS_KEY'
secret_key = 'YOUR_SECRET_KEY'

@private_v3_api = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key)
```

### User
#### [GET /api/v3/info](https://max-api.maicoin.com/doc/v3.html#tag/User/operation/getApiV3Info)

> Get user information

```rb
@private_v3_api.member_info
```

### Account
#### [GET api/v3/wallet/{wallet_type}/accounts](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletPathWalletTypeAccounts)

> Get your account balance with all supported currencies by different wallet type

```rb
@private_v3_api.accounts

# provide all possible parameters
@private_v3_api.accounts(wallet_type: 'm', currency: 'usdt')
```

### M-Wallet
#### [GET api/v3/wallet/m/ad_ratio](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMAdRatio)

> Get the latest AD ratio of your m-wallet

```rb
@private_v3_api.m_wallet_ad_ratio
```

#### [POST api/v3/wallet/m/loan](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/postApiV3WalletMLoan)

> Create a loan request for your m-wallet

```rb
@private_v3_api.m_wallet_loan!('30000', 'usdt')
```

#### [POST api/v3/wallet/m/repayment](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/postApiV3WalletMRepayment)

> Make a repayment for your loan

```rb
@private_v3_api.m_wallet_repay!('30000', 'usdt')
```

#### [GET api/v3/wallet/m/loans](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLoans)

> Get loan history of your m-wallet

```rb
@private_v3_api.m_wallet_loans('usdt')

# provide all possible parameters
@private_v3_api.m_wallet_loans(
  'usdt',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET api/v3/wallet/m/repayments](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMRepayments)

> Get repayment history of your m-wallet

```rb
@private_v3_api.m_wallet_repayments('usdt')

# provide all possible parameters
@private_v3_api.m_wallet_repayments(
  'usdt',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET api/v3/wallet/m/liquidations](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLiquidations)

> Get liquidation history of your m-wallet

```rb
@private_v3_api.m_wallet_liquidations

# provide all possible parameters
@private_v3_api.m_wallet_liquidations(
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET api/v3/wallet/m/liquidation](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLiquidation)

> Get detail of one specific liquidation history of your m-wallet

```rb
@private_v3_api.m_wallet_liquidation('210407080800050666')
```

#### [GET api/v3/wallet/m/interests](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMInterests)

> Get interest history of your m-wallet

```rb
@private_v3_api.m_wallet_interests('usdt')

# provide all possible parameters
@private_v3_api.m_wallet_interests(
  'usdt',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

### Convert
#### [GET /api/v3/converts](https://max-api.maicoin.com/doc/v3.html#tag/Convert/operation/getApiV3Converts)

> Get convert orders history

```rb
@private_v3_api.convert_orders

# provide all possible parameters
@private_v3_api.convert_orders(
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET /api/v3/convert](https://max-api.maicoin.com/doc/v3.html#tag/Convert/operation/getApiV3Convert)

> Get details of a specific convert order

```rb
@private_v3_api.convert_order('6322d9bd-736b-4f19-b862-829e75cae1ce')
```

#### [POST /api/v3/convert](https://max-api.maicoin.com/doc/v3.html#tag/Convert/operation/postApiV3Convert)

> Execute a convert (flash exchange) between two currencies

```rb
# Specify from amount
@private_v3_api.create_convert_order(
  from: ['0.52', 'usdt'],
  to: [nil, 'twd'],
)

# Specify to amount
@private_v3_api.create_convert_order(
  from: [nil, 'usdt'],
  to: ['16.58', 'twd'],
)
```

### Order
#### [GET /api/v3/wallet/{wallet_type}/orders/open](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/getApiV3WalletPathWalletTypeOrdersOpen)

> Get open orders.

```rb
# use default parameters
@private_v3_api.open_orders('maxtwd')

# provide all possible parameters
@private_v3_api.open_orders(
  'maxtwd',
  wallet_type: 'm', # 'spot' or 'm'
  timestamp: 1773734452000,
  order_by: 'desc',
  limit: 15,
)
```

#### [GET /api/v3/wallet/{wallet_type}/orders/closed](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/getApiV3WalletPathWalletTypeOrdersClosed)

> Get closed orders.

```rb
# use default parameters
@private_v3_api.closed_orders('maxtwd')

# provide all possible parameters
@private_v3_api.closed_orders(
  'maxtwd',
  wallet_type: 'm', # 'spot' or 'm'
  timestamp: 1773734452000,
  order_by: 'desc',
  limit: 15,
)
```

#### [GET /api/v3/wallet/{wallet_type}/orders/history](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/getApiV3WalletPathWalletTypeOrdersHistory)

> Get order history in ascending order from a specific from_id.

```rb
# use default parameters
@private_v3_api.order_history('maxtwd')

# provide all possible parameters
@private_v3_api.orders_history(
  'maxtwd',
  wallet_type: 'm', # 'spot' or 'm'
  from_id: 123456,
  limit: 15,
)
```

#### [POST /api/v3/wallet/{wallet_type}/order](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/postApiV3WalletPathWalletTypeOrder)

> Create sell/buy order

```rb
# use default parameters
@private_v3_api.create_order!('maxtwd', 'buy', 1000, price: 7.5)

# provide all possible parameters
@private_v3_api.create_order!(
  'maxtwd',
  'buy',
  1000,
  wallet_type: 'm', # 'spot' or 'm'
  price: 7.5,
  client_oid: 'MY_ORDER_ID_12345',
  stop_price: 8,
  ord_type: 'limit',
  group_id: 12345678,
)
```

#### [GET /api/v3/order](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/getApiV3Order)

> Get order detail

```rb
# use default parameters
# use max unique order id
@private_v3_api.order(123456)

# use user specified order id
@private_v3_api.order(client_oid: 'MY_ORDER_123456')
```

#### [DELETE /api/v3/wallet/{wallet_type}/order](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/deleteApiV3WalletPathWalletTypeOrders)

> Cancel all orders

```rb
# use default parameters
@private_v3_api.cancel_orders!

# provide all possible parameters
@private_v3_api.cancel_orders!(
  wallet_type: 'm', # 'spot' or 'm'
  market: 'maxtwd', 
  side: 'sell',
  group_id: '123456',
)
```

#### [DELETE /api/v3/order](https://max-api.maicoin.com/doc/v3.html#tag/Order/operation/deleteApiV3Order)

> Cancel an order

```rb
# use max unique order id
@private_v3_api.cancel_order!(123456)

# use user specified order id
@private_v3_api.cancel_order!(client_oid: 'MY_ORDER_123456')
```

## Public V2 Api Examples

```rb
@private_v2_api = MaxExchangeApi::PublicV2Api.new
```

#### [GET /api/v2/vip_levels](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevels)

> Get all VIP level fees.

```rb
@private_v2_api.vip_levels
```

#### [GET /api/v2/vip_levels/{level}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevelsLevel)

> Get VIP level fee by level.

```rb
@private_v2_api.vip_levels(2)
```

#### [GET /api/v2/currencies](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Currencies)

> Get all available currencies.

```rb
@private_v2_api.currencies
```

#### [GET /api/v2/k](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2K)

> Get OHLC(k line) of a specific market.

```rb
# use default parameters
@private_v2_api.k('btctwd')

# provide all possible parameters
@private_v2_api.k('btctwd', limit: 30, period: 1, timestamp: 1624705402)
```

#### [GET /api/v2/depth](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Depth)

> Get depth of a specified market.

```rb
# use default parameters
@private_v2_api.depth('maxtwd')

# provide all possible parameters
@private_v2_api.depth('maxtwd', limit: 10, sort_by_price: true)
```

#### [GET /api/v2/trades](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Trades)

> Get recent trades on market, sorted in reverse creation order.

```rb
# use default parameters
@private_v2_api.trades('btctwd')

# provide all possible parameters
@private_v2_api.trades(
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

#### [GET /api/v2/markets](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Markets)

> Get all available markets.

```rb
@private_v2_api.markets
```

#### [GET /api/v2/summary](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Summary)

> Overview of market data for all tickers.

```rb
@private_v2_api.summary
```

#### [GET /api/v2/tickers/{path_market}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2TickersPathMarket)

> Get ticker of specific market.

```rb
@private_v2_api.tickers('btctwd')
```

#### [GET /api/v2/tickers](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Tickers)

> Get ticker of all markets.

```rb
@private_v2_api.tickers
```

#### [GET /api/v2/timestamp](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Timestamp)

> Get server current time, in seconds since Unix epoch.

```rb
@private_v2_api.timestamp
>>>>>>> 81e2138 (adjust readme sections)
```

### Deposit
#### [GET /api/v3/deposit_address](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3DepositAddress)

> Get user deposit address by currency version

```rb
@private_v2_api.deposit_address('bscusdt')
```

#### [GET /api/v3/deposits](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Deposits)

> get your deposits history

```rb
# use default parameters
@private_v2_api.deposits

# provide all possible parameters
@private_v2_api.deposits(
  currency: 'max',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET /api/v3/deposit](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Deposit)

> Get details of a specific deposit

```rb
# Query by uuid
@private_v2_api.deposit(uuid: '18022603540001')

# Query by txid
@private_v2_api.deposit(txid: '0x8daa98e07886985bd6a142cd81b83582d6085f7eb931dc4984c18c84f2a845e0')
```

## Private V2 Api Examples

```rb
access_key = 'YOUR_ACCESS_KEY'
secret_key = 'YOUR_SECRET_KEY'

@private_v2_api = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key)
```

### User
#### [GET /api/v2/members/profile](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MembersProfile)

> get personal profile information

```rb
@private_v2_api.member_profile
```

#### [GET /api/v2/members/me](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MembersMe)

> get your profile and accounts information

```rb
@private_v2_api.me
```

#### [GET /api/v2/members/vip_level](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MembersVipLevel)

> get VIP level info

```rb
@private_v2_api.vip_level
```

### Account
#### [GET /api/v2/members/accounts](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MembersAccounts)

> get personal accounts information

```rb
@private_v2_api.accounts
```

#### [GET /api/v2/members/accounts/{path_currency}](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MembersAccountsPathCurrency)

> get personal accounts information of a currency

```rb
@private_v2_api.account(currnecy)
```

### Order
#### [GET /api/v2/orders](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Orders)

> get your orders, results is paginated.

```rb
# use default parameters
@private_v2_api.orders('maxtwd')

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

#### [GET /api/v2/order](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Order)

> get a specific order.

```rb
# use max unique order id
@api.order(123456)

# use user specified order id
@api.order('MY_ORDER_123456', use_client_id: true)
```

#### [POST /api/v2/orders/clear](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2OrdersClear)

> cancel all your orders with given market and side

```rb
# use default parameters
@api.cancel_orders!

# provide all possible parameters
@api.cancel_orders!(market: 'maxtwd', side: 'sell', group_id: '123456')
```

#### [POST /api/v2/order/delete](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2OrderDelete)

> cancel an order

```rb
# use max unique order id
@api.cancel_order!(123456)

# use user specified order id
@api.cancel_order!('MY_ORDER_123456', use_client_id: true)
```

#### [POST /api/v2/orders](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2Orders)

> create a sell/buy order

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

#### [POST /api/v2/orders/multi/onebyone](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2OrdersMultiOnebyone)

> Create multiple sell/buy orders, orders may be partially accepted, please put your orders as an array in json body.

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

### Trade
#### [GET /api/v2/trades/my/of_order](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2TradesMyOfOrder)

> get your executed trades related to a order

```rb
# use max unique order id
@private_v2_api.my_trades_of_order(123456)

# use user specified order id
@private_v2_api.my_trades_of_order('MY_ORDER_123456', use_client_id: true)
```

#### [GET /api/v2/trades/my](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2TradesMy)

> get your executed trades, sorted in reverse creation order

```rb
# use default parameters
@private_v2_api.my_trades('btctwd')

# provide all possible parameters
@private_v2_api.my_trades(
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

### Deposit
#### [GET /api/v2/deposits](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Deposits)

> get your deposits history

```rb
# use default parameters
@private_v2_api.deposits('max')

# provide all possible parameters
@private_v2_api.deposits(
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

#### [GET /api/v2/deposit](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Deposit)

> get details of a specific deposit

```rb
@private_v2_api.deposit('transaction_id')
```

#### [GET /api/v2/deposit_addresses](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2DepositAddresses)

> The addresses could be empty before generated, please call POST /deposit_addresses in that case

```rb
# use default parameters
@private_v2_api.deposit_addresses

# provide all possible parameters
@private_v2_api.deposit_addresses(currency: 'twd', pagination: true, page: 3, limit: 15, offset: 5)
```

#### [POST /api/v2/deposit_addresses](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2DepositAddresses)

> Address creation is asynchronous, please call GET /deposit_addresses later to get generated addresses

```rb
@private_v2_api.create_deposit_addresses!('twd')
```

### Withdrawal
#### [GET /api/v2/withdrawals](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Withdrawals)

> get your external withdrawals history

```rb
# use default parameters
@private_v2_api.withdrawals('max')

# provide all possible parameters
@private_v2_api.withdrawals(
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

#### [GET /api/v2/withdrawal](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Withdrawal)

> get details of a specific external withdraw

```rb
@private_v2_api.withdrawal('withdraw_id')
```

#### [POST /api/v2/withdrawal](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/postApiV2Withdrawal)

> submit a withdrawal. IP whitelist for api token is required.

```rb
@private_v2_api.create_withdrawal!('twd', 'withdraw_address_id', 100000)
```

#### [GET /api/v2/withdraw_addresses](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2WithdrawAddresses)

> get withdraw addresses

```rb
# use default parameters
@private_v2_api.withdraw_addresses('twd')

# provide all possible parameters
@private_v2_api.withdraw_addresses('usdt', pagination: true, page: 3, limit: 15, offset: 5)
```

### Internal Transfer
#### [GET /api/v2/internal_transfers](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2InternalTransfers)

> get internal transfers history

```rb
# use default parameters
@private_v2_api.internal_transfers

# provide all possible parameters
@private_v2_api.internal_transfers(
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

#### [GET /api/v2/internal_transfer](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2InternalTransfer)

> get details of a specific internal transfer

```rb
@private_v2_api.internal_transfer('internal_transfer_id')
```

### Reward
#### [GET /api/v2/rewards](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Rewards)

> get rewards history

```rb
# use default parameters
@private_v2_api.rewards

# provide all possible parameters
@private_v2_api.rewards(
  currency: 'btc',
  from: 68444,
  to: 69444,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```

#### [GET /api/v2/rewards/{path_reward_type}](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2RewardsPathRewardType)

> get specific rewards history

```rb
# use default parameters
@private_v2_api.rewards(reward_type: 'airdrop_rewards')

# provide all possible parameters
@private_v2_api.rewards(
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

#### [GET /api/v2/max_rewards/yesterday](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2MaxRewardsYesterday)

> get max rewards yesterday

```rb
@private_v2_api.max_rewards_yesterday
```

#### [GET /api/v2/yields](https://max-api.maicoin.com/doc/v2.html#tag/private/operation/getApiV2Yields)

> get yields history

```rb
# use default parameters
@private_v2_api.yields

# provide all possible parameters
@private_v2_api.yields(
  currency: 'usdt',
  from: 68444,
  to: 69444,
  pagination: true,
  page: 3,
  limit: 15,
  offset: 5,
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/max_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

