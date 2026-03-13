# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module UserApi
      def member_profile
        send_request(:get, '/members/profile', {})
      end

      def me
        send_request(:get, '/members/me', {})
      end

      def vip_level
        send_request(:get, '/members/vip_level', {})
      end
    end
  end
end
