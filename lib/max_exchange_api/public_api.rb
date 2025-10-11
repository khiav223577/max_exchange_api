# frozen_string_literal: true

require 'max_exchange_api/base_api'

module MaxExchangeApi
  class PublicApi < BaseApi

    protected

    def send_request(method, path, query)
      super(method, path, {}, query)
    end
  end
end
