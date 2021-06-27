# frozen_string_literal: true

module MaxExchangeApi
  class Config
    attr_accessor :timeout
    attr_accessor :logger

    def initialize(data = nil)
      data ||= {}
      @timeout = data[:timeout]
      @logger = data[:logger]
    end

    def reverse_merge!(other)
      @timeout ||= other.timeout
      @logger ||= other.logger
    end
  end

  @default_config = Config.new
  @default_config.timeout = 3

  class << self
    attr_reader :default_config
  end
end
