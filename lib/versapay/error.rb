# frozen_string_literal: true
require 'json'

class Versapay::Error < StandardError
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def code
    response.code
  end

  def json_body
    JSON.parse(response.body)
  end
end
