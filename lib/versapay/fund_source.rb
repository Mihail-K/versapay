# frozen_string_literal: true
module Versapay
  class FundSource < Versapay::Object
    def self.list
      Versapay::Client.get('funds').map(&method(:new))
    end
  end
end
