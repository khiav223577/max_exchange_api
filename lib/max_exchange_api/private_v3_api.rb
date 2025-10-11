# frozen_string_literal: true

require 'max_exchange_api/private_api'

module MaxExchangeApi
  class PrivateV3Api < PrivateApi
    base_uri 'https://max-api.maicoin.com/api/v3'
  end
end
