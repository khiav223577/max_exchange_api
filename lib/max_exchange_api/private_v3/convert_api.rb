# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module ConvertApi
      def convert_orders(timestamp: nil, order_by: 'desc', limit: 50)
        send_request(:get, '/converts', timestamp: timestamp, order: order_by, limit: limit)
      end

      def convert_order(sn)
        send_request(:get, '/convert', sn: sn)
      end

      def create_convert_order(from: [], to: [])
        from_amount, from_currency = from
        to_amount, to_currency = to

        send_request(
          :post,
          '/convert',
          from_amount: from_amount,
          from_currency: from_currency,
          to_amount: to_amount,
          to_currency: to_currency,
        )
      end
    end
  end
end
