# frozen_string_literal: true
module Versapay
  class Agreement < Versapay::Object
    def self.sent(page = nil)
      params = { page: page } unless page.nil?
      Versapay::Client.get('debit_agreements/sent', headers: { params: params }).map(&method(:new))
    end

    def self.received(page = nil)
      params = { page: page } unless page.nil?
      Versapay::Client.get('debit_agreements/received', headers: { params: params }).map(&method(:new))
    end

    def self.create(payload = {})
      new(Versapay::Client.post('debit_agreements', payload: payload))
    end

    def self.approve(token, fund_token = nil)
      token = token.token if token.is_a?(Versapay::Agreement)
      fund_token = fund_token.token if fund_token.is_a?(Versapay::FundSource)

      params = { fund_token: fund_token } unless fund_token.nil?
      new(Versapay::Client.post("debit_agreements/#{token}/approve", headers: { params: params }))
    end

    def self.reject(token)
      token = token.token if token.is_a?(Versapay::Agreement)
      new(Versapay::Client.post("debit_agreements/#{token}/reject"))
    end

    def self.cancel(token)
      token = token.token if token.is_a?(Versapay::Agreement)
      new(Versapay::Client.post("debit_agreements/#{token}/cancel"))
    end

    def self.revoke(token)
      token = token.token if token.is_a?(Versapay::Agreement)
      new(Versapay::Client.post("debit_agreements/#{token}/revoke"))
    end
  end
end
