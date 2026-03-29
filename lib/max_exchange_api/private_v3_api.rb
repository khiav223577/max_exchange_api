# frozen_string_literal: true

require 'max_exchange_api/private_api'
require 'max_exchange_api/private_v3/user_api'
require 'max_exchange_api/private_v3/account_api'
require 'max_exchange_api/private_v3/m_wallet_api'
require 'max_exchange_api/private_v3/convert_api'
require 'max_exchange_api/private_v3/order_api'

module MaxExchangeApi
  class PrivateV3Api < PrivateApi
    base_uri 'https://max-api.maicoin.com/api/v3'

    include PrivateV3::UserApi
    include PrivateV3::AccountApi
    include PrivateV3::MWalletApi
    include PrivateV3::ConvertApi
    include PrivateV3::OrderApi
  end
end
