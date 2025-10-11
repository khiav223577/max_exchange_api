# frozen_string_literal: true

require 'max_exchange_api/public_api'

module MaxExchangeApi
  class PublicV3Api < PublicApi
    base_uri 'https://max-api.maicoin.com/api/v3'

    def available_loan_amount
      send_request(:get, '/wallet/m/limits', {})
    end
  end
end
