# frozen_string_literal: true

module MaxExchangeApi
  module Helper
    class << self
      def gen_headers(payload, access_key, secret_key)
        encoded_payload = encode(payload)

        return {
          'X-MAX-ACCESSKEY' => access_key,
          'X-MAX-PAYLOAD'   => encoded_payload,
          'X-MAX-SIGNATURE' => encrypt(encoded_payload, secret_key),
        }
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
