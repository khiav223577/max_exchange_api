# frozen_string_literal: true

require 'max_exchange_api/base_api'

module MaxExchangeApi
  class PrivateApi < BaseApi
    def initialize(access_key, secret_key, config: nil)
      super(config: config)

      @access_key = access_key
      @secret_key = secret_key
      @base_path = URI.parse(self.class.base_uri).path
    end

    protected

    def send_request(method, path, query)
      query = query.compact
      query.merge!(path: "#{@base_path}#{path}", nonce: (Time.now.to_f * 1000).to_i)
      return super(method, path, Helper.gen_headers(query, @access_key, @secret_key), query)
    end
  end
end
