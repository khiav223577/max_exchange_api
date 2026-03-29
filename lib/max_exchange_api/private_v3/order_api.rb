# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module OrderApi
      def open_orders(market, timestamp: nil, order_by: 'desc', limit: 50, wallet_type: 'spot')
        send_request(
          :get,
          "/wallet/#{wallet_type}/orders/open",
          market: market,
          state: state,
          timestamp: timestamp,
          order_by: order_by,
          limit: limit,
        )
      end

      def closed_orders(market, timestamp: nil, order_by: 'desc', limit: 50, wallet_type: 'spot')
        send_request(
          :get,
          "/wallet/#{wallet_type}/orders/closed",
          market: market,
          state: state,
          timestamp: timestamp,
          order_by: order_by,
          limit: limit,
        )
      end

      def orders_history(market, from_id: 1, limit: 50, wallet_type: 'spot')
        send_request(
          :get,
          "/wallet/#{wallet_type}/orders/history",
          market,
          from_id: from_id,
          limit: limit,
        )
      end

      def create_order!(market, side, volume, price: nil, client_oid: nil, stop_price: nil, ord_type: nil, group_id: nil, wallet_type: 'spot')
        send_request(
          :post,
          "/wallet/#{wallet_type}/order",
          market: market,
          side: side,
          volume: volume,
          price: price,
          client_oid: client_oid,
          stop_price: stop_price,
          ord_type: ord_type,
          group_id: group_id,
        )
      end

      def order(order_id = nil, client_oid: nil)
        if order_id
          send_request(:get, '/order', id: order_id)
        else
          send_request(:get, '/order', client_oid: client_oid)
        end
      end

      def cancel_orders!(market: nil, side: nil, group_id: nil, wallet_type: 'spot')
        send_request(
          :delete,
          "/wallet/#{wallet_type}/orders/clear",
          market: market,
          side: side,
          group_id: group_id,
        )
      end

      def cancel_order!(order_id = nil, client_oid: nil)
        if order_id
          send_request(:delete, '/order', id: order_id)
        else
          send_request(:delete, '/order', client_oid: client_oid)
        end
      end
    end
  end
end
