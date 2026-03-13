# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module TradeApi
      def my_trades_of_order(order_id, use_client_id: false)
        id_params_key = use_client_id ? :client_oid : :id
        send_request(:get, '/trades/my/of_order', id_params_key => order_id)
      end

      def my_trades(market, timestamp: nil, from: nil, to: nil, order_by: 'desc', pagination: true, page: 1, limit: 50, offset: 0)
        send_request(
          :get,
          '/trades/my',
          market: market,
          timestamp: timestamp,
          from: from,
          to: to,
          order_by: order_by,
          pagination: pagination,
          page: page,
          limit: limit,
          offset: offset,
        )
      end
    end
  end
end
