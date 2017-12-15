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
      options[:method]   = method
      options[:url]      = build_url(path)
      options[:user]     = username
      options[:password] = password

      response = RestClient::Request.execute(options)
      JSON.parse(response.body)
    rescue RestClient::Exception => error
      raise Versapay::Error, error.response
    end

    def build_url(path)
      "https://#{host}/api/#{path}.json"
    end

    def host
      Versapay.versapay_host
    end

    def username
      Versapay.versapay_token
    end

    def password
      Versapay.versapay_key
    end
  end
end
