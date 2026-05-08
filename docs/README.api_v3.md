## Documentations

* [MAX V3 RESTful API List](https://max-api.maicoin.com/doc/v3.html)
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
      * [GET /api/v3/wallet/{wallet_type}/accounts](#get-apiv3walletwallet_typeaccounts)
    * [M-Wallet](#m-wallet)
      * [GET /api/v3/wallet/m/ad_ratio](#get-apiv3walletmad_ratio)
      * [POST /api/v3/wallet/m/loan](#post-apiv3walletmloan)
      * [POST /api/v3/wallet/m/repayment](#post-apiv3walletmrepayment)
      * [GET /api/v3/wallet/m/loans](#get-apiv3walletmloans)
      * [GET /api/v3/wallet/m/repayments](#get-apiv3walletmrepayments)
      * [GET /api/v3/wallet/m/liquidations](#get-apiv3walletmliquidations)
      * [GET /api/v3/wallet/m/liquidation](#get-apiv3walletmliquidation)
      * [GET /api/v3/wallet/m/interests](#get-apiv3walletminterests)
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
    * [Trade](#trade)
      * [GET /api/v3/order/trades](#get-apiv3ordertrades)
      * [GET /api/v3/wallet/{path_wallet_type}/trades](#get-apiv3walletpath_wallet_typetrades)
    * [Deposit](#deposit)
      * [GET /api/v3/deposit_address](#get-apiv3deposit_address)
      * [GET /api/v3/deposits](#get-apiv3deposits)
      * [GET /api/v3/deposit](#get-apiv3deposit)
    * [Withdraw](#withdraw)
      * [GET /api/v3/withdraw_addresses](#get-apiv3withdraw_addresses)
      * [GET /api/v3/withdrawals](#get-apiv3withdrawals)
      * [GET /api/v3/withdrawal](#get-apiv3withdrawal)
      * [POST /api/v3/withdrawal](#post-apiv3withdrawal)
      * [POST /api/v3/withdrawal/twd](#post-apiv3withdrawaltwd)
    * [Internal Transfer](#internal-transfer)
      * [GET /api/v3/internal_transfers](#get-apiv3internal_transfers)
    * [Reward](#reward)
      * [GET /api/v3/rewards](#get-apiv3rewards)
  * [SubAccount](#subaccount)
      * [GET /api/v3/sub_accounts](#get-apiv3sub_accounts)
      * [GET /api/v3/sub_account](#get-apiv3sub_account)
      * [POST /api/v3/sub_accounts](#post-apiv3sub_accounts)
      * [PUT /api/v3/sub_account](#put-apiv3sub_account)
      * [DELETE /api/v3/sub_account](#delete-apiv3sub_account)
      * [POST /api/v3/sub_account/transfer](#post-apiv3sub_accounttransfer)
  * [Development](#development)
  * [Contributing](#contributing)
  * [License](#license)
<!-- TOC -->

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

### Switch Sub-Account

```rb
@private_v3_api = MaxExchangeApi::PrivateV3Api.new(access_key, secret_key)

# Switch to a specific sub-account (e.g., 's1-a7f20f')
@private_v3_api.current_sub_account_sn = 's1-a7f20f'

# Use the default sub-account (determined by the API token owner)
@private_v3_api.current_sub_account_sn = nil

# Switch to the main account
@private_v3_api.current_sub_account_sn = 'main'
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
#### [GET /api/v3/wallet/{wallet_type}/accounts](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletPathWalletTypeAccounts)

> Get your account balance with all supported currencies by different wallet type

```rb
@private_v3_api.accounts

# provide all possible parameters
@private_v3_api.accounts(wallet_type: 'm', currency: 'usdt')
```

### M-Wallet
#### [GET /api/v3/wallet/m/ad_ratio](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMAdRatio)

> Get the latest AD ratio of your m-wallet

```rb
@private_v3_api.m_wallet_ad_ratio
```

#### [POST /api/v3/wallet/m/loan](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/postApiV3WalletMLoan)

> Create a loan request for your m-wallet

```rb
@private_v3_api.m_wallet_loan!('30000', 'usdt')
```

#### [POST /api/v3/wallet/m/repayment](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/postApiV3WalletMRepayment)

> Make a repayment for your loan

```rb
@private_v3_api.m_wallet_repay!('30000', 'usdt')
```

#### [GET /api/v3/wallet/m/loans](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLoans)

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

#### [GET /api/v3/wallet/m/repayments](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMRepayments)

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

#### [GET /api/v3/wallet/m/liquidations](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLiquidations)

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

#### [GET /api/v3/wallet/m/liquidation](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMLiquidation)

> Get detail of one specific liquidation history of your m-wallet

```rb
@private_v3_api.m_wallet_liquidation('210407080800050666')
```

#### [GET /api/v3/wallet/m/interests](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WalletMInterests)

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

### Trade
#### [GET /api/v3/order/trades](https://max-api.maicoin.com/doc/v3.html#tag/Trade/operation/getApiV3OrderTrades)

> Get trade detail by your order info

```rb
# use max unique order id
@private_v3_api.my_trades_of_order(123456)

# use user specified order id
@private_v3_api.my_trades_of_order(client_oid: 'MY_ORDER_123456')
```

#### [GET /api/v3/wallet/{path_wallet_type}/trades](https://max-api.maicoin.com/doc/v3.html#tag/Trade/operation/getApiV3WalletPathWalletTypeTrades)

> Get executed trades

```rb
# use default parameters
@private_v3_api.my_trades

# provide all possible parameters
@private_v3_api.my_trades(
  wallet_type: 'm', # 'spot' or 'm'
  market: 'maxtwd',
  timestamp: 1624705402,
  from_id: 68444,
  order_by: 'asc',
  limit: 15,
)
```

### Deposit
#### [GET /api/v3/deposit_address](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3DepositAddress)

> Get user deposit address by currency version

```rb
@private_v3_api.deposit_address('bscusdt')
```

#### [GET /api/v3/deposits](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Deposits)

> get your deposits history

```rb
# use default parameters
@private_v3_api.deposits

# provide all possible parameters
@private_v3_api.deposits(
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
@private_v3_api.deposit(uuid: '18022603540001')

# Query by txid
@private_v3_api.deposit(txid: '0x8daa98e07886985bd6a142cd81b83582d6085f7eb931dc4984c18c84f2a845e0')
```

### Withdraw
#### [GET /api/v3/withdraw_addresses](https://max-api.maicoin.com/doc/v3.html#tag/Wallet/operation/getApiV3WithdrawAddresses)

> Get withdraw addresses of spot wallet

```rb
@private_v3_api.withdraw_addresses('usdt')

# provide all possible parameters
@private_v3_api.withdraw_addresses('usdt', limit: 10, offset: 5)
```

#### [GET /api/v3/withdrawals](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Withdrawals)

> Get external withdrawals history

```rb
# use default parameters
@private_v3_api.withdraws

# provide all possible parameters
@private_v3_api.withdraws(
  currency: 'max',
  state: 'done',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

#### [GET /api/v3/withdrawal](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Withdrawal)

> Get details of a specific external withdraw

```rb
# Query by uuid
@private_v3_api.withdraw(uuid: '18022603540001')
```

#### [POST /api/v3/withdrawal](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/postApiV3Withdrawal)

> Submit a crypto withdrawal. IP whitelist for api token is required.

```rb
@private_v3_api.create_withdraw!('withdraw_address_id', 100000)
```

#### [POST /api/v3/withdrawal/twd](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/postApiV3WithdrawalTwd)

> Submit twd withdrawal to verified bank account. IP whitelist for api token is required.

```rb
@private_v3_api.create_twd_withdraw!(100000)
```

### Internal Transfer
#### [GET /api/v3/internal_transfers](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3InternalTransfers)

> Get internal transfers history

```rb
# use default parameters
@private_v3_api.internal_transfers

# provide all possible parameters
@private_v3_api.internal_transfers(
  currency: 'btc',
  side: 'in',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

### Reward
#### [GET /api/v3/rewards](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3Rewards)

> Get internal transfers history

```rb
# use default parameters
@private_v3_api.rewards

# provide all possible parameters
@private_v3_api.rewards(
  currency: 'btc',
  reward_type: 'yield',
  timestamp: 1624705402,
  order_by: 'asc',
  limit: 15,
)
```

## SubAccount
#### [GET /api/v3/sub_accounts](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3SubAccounts)

> Get sub_accounts

```rb
@private_v3_api.sub_accounts
```

#### [GET /api/v3/sub_account](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/getApiV3SubAccount)

> Get sub_account

```rb
@private_v3_api.sub_account('s1-a7f20f')
```

#### [POST /api/v3/sub_accounts](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/postApiV3SubAccounts)

> Create sub_account

```rb
@private_v3_api.create_sub_account!(name: 'My Test SubAccount')
```

#### [PUT /api/v3/sub_account](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/putApiV3SubAccount)

> Update sub_account

```rb
@private_v3_api.update_sub_account!('s1-a7f20f', name: 'My Test SubAccount')
```

#### [DELETE /api/v3/sub_account](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/deleteApiV3SubAccount)

> Delete sub_account

```rb
@private_v3_api.delete_sub_account!('s1-a7f20f')
```

#### [POST /api/v3/sub_account/transfer](https://max-api.maicoin.com/doc/v3.html#tag/Transaction/operation/postApiV3SubAccountTransfer)

> Submit sub_account transfer

```rb
# Transfer from main to s1 sub-account
@private_v3_api.current_sub_account_sn = 'main'
@private_v3_api.create_sub_account_transfer!('s1-a7f20f', 3, 'eth')

# Transfer from s1 sub-account to s2 sub-account
@private_v3_api.current_sub_account_sn = 's1-a7f20f'
@private_v3_api.create_sub_account_transfer!('s2-jsjwsa', 3, 'eth')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/max_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

