# frozen_string_literal: true
require 'json'
require 'rest-client'

class Versapay::Client
  class << self
    %w[get post].each do |method|
      define_method(method) do |path, options = {}|
        request(method, path, options)
      end
    end

  private

    def request(method, path, options)
      options[:method] = method
      options[:url] = build_url(path)

      response = RestClient::Request.execute(options)
      raise Versapay::Error, response if response.code >= 400

      JSON.parse(response.body)
    end

    def build_url(path)
      "https://#{username}:#{password}@#{host}/api/#{path}.json"
    end

    def host
      Versapay.versapay_host
    end

    def username
      Versapay.versapay_access_key
    end

    def password
      Versapay.versapay_secret_key
    end
  end
end
