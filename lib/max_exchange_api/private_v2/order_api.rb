# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module OrderApi
      def orders(market, state: nil, order_by: 'asc', group_id: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        send_request(
          :get,
          '/orders',
          market: market,
          state: state,
          order_by: order_by,
          group_id: group_id,
          pagination: pagination,
          page: page,
          limit: limit,
          offset: offset,
        )
      end

      def order(order_id, use_client_id: false)
        id_params_key = use_client_id ? :client_oid : :id
        send_request(:get, '/order', id_params_key => order_id)
      end

      def cancel_orders!(market: nil, side: nil, group_id: nil)
        send_request(:post, '/orders/clear', market: market, side: side, group_id: group_id)
      end

      def cancel_order!(order_id, use_client_id: false)
        id_params_key = use_client_id ? :client_oid : :id
        send_request(:post, '/order/delete', id_params_key => order_id)
      end

      def create_order!(market, side, volume, price: nil, client_oid: nil, stop_price: nil, ord_type: nil, group_id: nil)
        send_request(
          :post,
          '/orders',
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

      def create_orders!(market, orders, group_id: nil)
        send_request(:post, '/orders/multi/onebyone', market: market, orders: orders, group_id: group_id)
      end
    end
  end
end
