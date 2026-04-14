# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module MWalletApi
      def m_wallet_ad_ratio
        send_request(:get, '/wallet/m/ad_ratio', {})
      end

      def m_wallet_loan!(amount, currency)
        send_request(
          :post,
          '/wallet/m/loan',
          currency: currency,
          amount: amount,
        )
      end

      def m_wallet_repay!(amount, currency)
        send_request(
          :post,
          '/wallet/m/repayment',
          currency: currency,
          amount: amount,
        )
      end

      def m_wallet_loans(currency, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/wallet/m/loans',
          currency: currency,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end

      def m_wallet_repayments(currency, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/wallet/m/repayments',
          currency: currency,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end

      def m_wallet_liquidations(timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/wallet/m/liquidations',
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end

      def m_wallet_liquidation(sn)
        send_request(:get, '/wallet/m/liquidation', sn: sn)
      end

      def m_wallet_interests(currency, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/wallet/m/interests',
          currency: currency,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end
    end
  end
end
