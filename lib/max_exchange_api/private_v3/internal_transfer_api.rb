# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module InternalTransferApi
      def internal_transfers(currency: nil, side: 'in', timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/internal_transfers',
          currency: currency,
          side: side,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end
    end
  end
end
