# frozen_string_literal: true
require 'versapay/object'
require 'versapay/version'

module Versapay
  class << self
    attr_accessor :versapay_host
    attr_accessor :versapay_access_key
    attr_accessor :versapay_secret_key
  end
end
