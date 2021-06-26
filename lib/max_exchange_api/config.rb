# frozen_string_literal: true

module MaxExchangeApi
  class Config
    attr_accessor :default_timeout

    def initialize
      @default_timeout = 3
    end
  end

  @config = Config.new

  class << self
    attr_reader :config
  end
end
