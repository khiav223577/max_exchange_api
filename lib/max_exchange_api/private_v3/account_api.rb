# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module AccountApi
      def accounts(wallet_type: 'spot', currency: nil)
        send_request(
          :get,
          "/wallet/#{wallet_type}/accounts",
          currency: currency,
        )
      end
    end
  end
end
