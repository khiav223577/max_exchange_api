## Documentations

* [MAX API Introduction](https://campaign.maicoin.com/api)
* [MAX V2 RESTful API List](https://max-api.maicoin.com/doc/v2.html)
* [WebSocket API Documentation](https://maicoin.github.io/max-websocket-docs/)

## Table of contents

<!-- TOC -->
  * [Documentations](#documentations)
  * [Table of contents](#table-of-contents)
  * [Usage](#usage)
  * [Configuration](#configuration)
    * [Set timeout time](#set-timeout-time)
    * [Logging](#logging)
    * [Switch Sub-Account](#switch-sub-account)
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
  * [Private V2 Api Examples](#private-v2-api-examples)
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
<!-- TOC -->

## Usage

```rb
@public_v2_api = MaxExchangeApi::PublicV2Api.new
@public_v2_api.depth('usdttwd')

access_key, secret_key = File.read('secret').split(',')
@private_v2_api = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key)
@private_v2_api.create_order!('usdttwd', 'sell', 1000, price: 31.35)
@private_v2_api.create_order!('usdttwd', 'buy', 1000, price: 31.15)
```

## Configuration

### Set timeout time

```rb
# Set default timeout time
MaxExchangeApi.default_config.timeout = 3 # seconds

# Create an api instance with custom timeout time
api = MaxExchangeApi::PublicV2Api.new(config: { timeout: 12 })
api = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key, config: { timeout: 12 })
```

### Logging

```rb
require 'logger'

# Print log to standard output
MaxExchangeApi.default_config.logger = Logger.new(STDOUT)

# Print log to file
MaxExchangeApi.default_config.logger = Logger.new('log/api.log')

# Create an api instance with custom logger
api = MaxExchangeApi::PublicV2Api.new(config: { logger: Logger.new(STDOUT) })
api = MaxExchangeApi::PrivateV2Api.new(access_key, secret_key, config: { logger: Logger.new(STDOUT) })
```

### Switch Sub-Account

Not supported in V2 API

## Public V2 Api Examples

```rb
@public_v2_api = MaxExchangeApi::PublicV2Api.new
```

#### [GET /api/v2/vip_levels](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevels)

> Get all VIP level fees.

```rb
@public_v2_api.vip_levels
```

#### [GET /api/v2/vip_levels/{level}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2VipLevelsLevel)

> Get VIP level fee by level.

```rb
@public_v2_api.vip_levels(2)
```

#### [GET /api/v2/currencies](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Currencies)

> Get all available currencies.

```rb
@public_v2_api.currencies
```

#### [GET /api/v2/k](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2K)

> Get OHLC(k line) of a specific market.

```rb
# use default parameters
@public_v2_api.k('btctwd')

# provide all possible parameters
@public_v2_api.k('btctwd', limit: 30, period: 1, timestamp: 1624705402)
```

#### [GET /api/v2/depth](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Depth)

> Get depth of a specified market.

```rb
# use default parameters
@public_v2_api.depth('maxtwd')

# provide all possible parameters
@public_v2_api.depth('maxtwd', limit: 10, sort_by_price: true)
```

#### [GET /api/v2/trades](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Trades)

> Get recent trades on market, sorted in reverse creation order.

```rb
# use default parameters
@public_v2_api.trades('btctwd')

# provide all possible parameters
@public_v2_api.trades(
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
@public_v2_api.markets
```

#### [GET /api/v2/summary](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Summary)

> Overview of market data for all tickers.

```rb
@public_v2_api.summary
```

#### [GET /api/v2/tickers/{path_market}](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2TickersPathMarket)

> Get ticker of specific market.

```rb
@public_v2_api.tickers('btctwd')
```

#### [GET /api/v2/tickers](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Tickers)

> Get ticker of all markets.

```rb
@public_v2_api.tickers
```

#### [GET /api/v2/timestamp](https://max-api.maicoin.com/doc/v2.html#tag/public/operation/getApiV2Timestamp)

> Get server current time, in seconds since Unix epoch.

```rb
@public_v2_api.timestamp
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
