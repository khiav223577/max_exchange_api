# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module AccountApi
      def accounts
        send_request(:get, '/members/accounts', {})
      end

      def account(currency)
        send_request(:get, "/members/accounts/#{currency}", {})
      end
    end
  end
end
