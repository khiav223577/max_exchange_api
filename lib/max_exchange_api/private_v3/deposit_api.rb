# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module DepositApi
      def deposit_address(currency_version)
        send_request(:get, '/deposit_address', currency_version: currency_version)
      end

      def deposits(currency: nil, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/deposits',
          currency: currency,
          timestamp: timestamp,
          order: order_by,
          limit: limit
        )
      end

      def deposit(txid:, uuid:)
        send_request(:get, '/deposit', txid: txid, uuid: uuid)
      end
    end
  end
end
