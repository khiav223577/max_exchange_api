# frozen_string_literal: true

require 'httparty'
require 'max_exchange_api/helper'

module MaxExchangeApi
  class BaseApi
    include HTTParty

    protected

    def send_request(method, path, headers, query)
      uuid = SecureRandom.uuid
      print_log(:info, "[API] #{uuid} #{method.upcase} '#{path}' query = #{query}")

      begin
        response = self.class.send(
          method,
          path,
          headers: headers,
          query: query,
          timeout: MaxExchangeApi.default_config.timeout,
        ).parsed_response

        print_log(:info, "[API] #{uuid} response #{response}")
        return response
      rescue => error
        print_log(:error, "[API] #{uuid} raise exception #{error.message}")
        raise error
      end
    end

    private

    def print_log(method, message)
      logger = MaxExchangeApi.default_config.logger
      logger.send(method, message) if logger
    end
  end
end
