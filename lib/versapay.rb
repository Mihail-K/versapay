# frozen_string_literal: true
require 'versapay/client'
require 'versapay/error'
require 'versapay/object'
require 'versapay/agreement'
require 'versapay/fund_source'
require 'versapay/transaction'
require 'versapay/version'

module Versapay
  class << self
    attr_accessor :versapay_host
    attr_accessor :versapay_access_key
    attr_accessor :versapay_secret_key

    def load_env
      %w[VERSAPAY_HOST VERSAPAY_ACCESS_KEY VERSAPAY_SECRET_KEY].each do |key|
        send("#{key.downcase}=", ENV.fetch(key))
      end
    end
  end
end
