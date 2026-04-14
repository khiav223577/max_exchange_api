# frozen_string_literal: true

require 'base64'
require 'json'

module MaxExchangeApi
  module Helper
    class << self
      def gen_headers(payload, access_key, secret_key, sub_account_sn: nil)
        encoded_payload = encode(payload)

        headers = {
          'X-MAX-ACCESSKEY' => access_key,
          'X-MAX-PAYLOAD'   => encoded_payload,
          'X-MAX-SIGNATURE' => encrypt(encoded_payload, secret_key),
        }

        headers['X-Sub-Account'] = sub_account_sn if sub_account_sn

        return headers
      end

      private

      def encode(data)
        Base64.strict_encode64(data.to_json)
      end

      def encrypt(data, key)
        OpenSSL::HMAC.digest('sha256', key, data).unpack('H*')[0]
      end
    end
  end
end
