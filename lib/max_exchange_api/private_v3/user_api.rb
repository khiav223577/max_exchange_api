# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module UserApi
      def member_info
        send_request(:get, '/info', {})
      end
    end
  end
end
