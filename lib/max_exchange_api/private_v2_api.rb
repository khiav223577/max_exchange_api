# frozen_string_literal: true

require 'max_exchange_api/private_api'
require 'max_exchange_api/private_v2/user_api'
require 'max_exchange_api/private_v2/order_api'
require 'max_exchange_api/private_v2/trade_api'
require 'max_exchange_api/private_v2/wallet_api'
require 'max_exchange_api/private_v2/transaction_api'

module MaxExchangeApi
  class PrivateV2Api < PrivateApi
    base_uri 'https://max-api.maicoin.com/api/v2'

    include PrivateV2::UserApi
    include PrivateV2::OrderApi
    include PrivateV2::TradeApi
    include PrivateV2::WalletApi
    include PrivateV2::TransactionApi
  end
end
