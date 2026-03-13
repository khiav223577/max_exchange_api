# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module RewardApi
      def rewards(reward_type: nil, currency: nil, from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        path = reward_type ? "/rewards/#{reward_type}" : '/rewards'
        send_request(
          :get,
          path,
          currency: currency,
          from: from,
          to: to,
          pagination: pagination,
          page: page,
          limit: limit,
          offset: offset,
        )
      end

      def yields(currency: nil, from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        send_request(
          :get,
          '/yields',
          currency: currency,
          from: from,
          to: to,
          pagination: pagination,
          page: page,
          limit: limit,
          offset: offset,
        )
      end

      def max_rewards_yesterday
        send_request(:get, '/max_rewards/yesterday', {})
      end
    end
  end
end
