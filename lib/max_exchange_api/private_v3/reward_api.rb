# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module RewardApi
      def rewards(currency: nil, reward_type: nil, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/internal_transfers',
          currency: currency,
          reward_type: reward_type,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end
    end
  end
end
