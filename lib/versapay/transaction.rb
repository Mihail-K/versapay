# frozen_string_literal: true
module Versapay
  class Transaction < Versapay::Object
    def self.list(page = nil)
      Versapay::Client.get('transactions', headers: { params: { page: page } }).map(&method(:new))
    end

    def self.retrieve(token)
      new(Versapay::Client.get("transactions/#{token}"))
    end

    def self.create(payload = {})
      new(Versapay::Client.post('transactions', payload: payload))
    end

    def self.approve(token, fund_token = nil)
      token = token.token if token.is_a?(Versapay::Transaction)
      fund_token = fund_token.token if fund_token.is_a?(Versapay::FundSource)

      params = { fund_token: fund_token } unless fund_token.nil?
      new(Versapay::Client.post("transactions/#{token}/approve"), headers: { params: params })
    end

    def self.cancel(token)
      token = token.token if token.is_a?(Versapay::Transaction)
      new(Versapay::Client.post("transactions/#{token}/cancel"))
    end
  end
end
