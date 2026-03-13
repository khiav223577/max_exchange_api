# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module InternalTransferApi
      def internal_transfers(currency: nil, side: 'in', from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        send_request(
          :get,
          '/internal_transfers',
          currency: currency,
          side: side,
          from: from,
          to: to,
          pagination: pagination,
          page: page,
          limit: limit,
          offset: offset,
        )
      end

      def internal_transfer(internal_transfer_id)
        send_request(:get, '/internal_transfer', uuid: internal_transfer_id)
      end
    end
  end
end
