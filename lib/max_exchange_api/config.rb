# frozen_string_literal: true

module MaxExchangeApi
  class Config
    attr_accessor :timeout
    attr_accessor :logger

    def initialize
      @timeout = 3
      @logger = nil
    end
  end

  @default_config = Config.new

  class << self
    attr_reader :default_config
  end
end
