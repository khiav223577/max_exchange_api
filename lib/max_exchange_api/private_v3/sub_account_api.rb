# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module SubAccountApi
      def sub_accounts
        send_request(:get, '/sub_accounts', {})
      end

      def sub_account(sn)
        send_request(:get, '/sub_account', sn: sn)
      end

      def create_sub_account!(name:)
        send_request(:post, '/sub_accounts', name: name)
      end

      def update_sub_account!(sn, name:)
        send_request(:put, '/sub_account', sn: sn, name: name)
      end

      def delete_sub_account!(sn)
        send_request(:delete, '/sub_account', sn: sn)
      end

      def create_sub_account_transfer!(to_sn, amount, currency)
        send_request(:post, '/sub_account/transfer', to_sn: to_sn, currency: currency, amount: amount)
      end
    end
  end
end
