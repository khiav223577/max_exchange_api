# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module TradeApi
      def my_trades_of_order(order_id = nil, client_oid: nil)
        if order_id
          send_request(:get, '/order/trades', order_id: order_id)
        else
          send_request(:get, '/order/trades', client_oid: client_oid)
        end
      end

      def my_trades(wallet_type: 'spot', market: nil, timestamp: nil, from_id: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          "/wallet/#{wallet_type}/trades",
          market: market,
          timestamp: timestamp,
          from_id: from_id,
          order: order_by,
          limit: limit,
        )
      end
    end
  end
end
