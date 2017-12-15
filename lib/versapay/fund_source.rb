# frozen_string_literal: true
class Versapay::FundSource < Versapay::Object
  def self.list
    Versapay::Client.get('funds').map(&method(:new))
  end
end
