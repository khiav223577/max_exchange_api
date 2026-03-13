# frozen_string_literal: true

require 'max_exchange_api/private_api'
require 'max_exchange_api/private_v2/user_api'
require 'max_exchange_api/private_v2/account_api'
require 'max_exchange_api/private_v2/order_api'
require 'max_exchange_api/private_v2/trade_api'
require 'max_exchange_api/private_v2/deposit_api'
require 'max_exchange_api/private_v2/withdraw_api'
require 'max_exchange_api/private_v2/internal_transfer_api'
require 'max_exchange_api/private_v2/reward_api'

module MaxExchangeApi
  class PrivateV2Api < PrivateApi
    base_uri 'https://max-api.maicoin.com/api/v2'

    include PrivateV2::UserApi
    include PrivateV2::AccountApi
    include PrivateV2::OrderApi
    include PrivateV2::TradeApi
    include PrivateV2::DepositApi
    include PrivateV2::WithdrawApi
    include PrivateV2::InternalTransferApi
    include PrivateV2::RewardApi
  end
end
