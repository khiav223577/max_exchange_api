# frozen_string_literal: true

require 'httparty'
require 'max_exchange_api/helper'

module MaxExchangeApi
  class BaseApi
    include HTTParty

    class << self
      def instance
        @instance ||= new
      end
    end

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
          timeout: 3,
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
      puts message
    end
  end
end
