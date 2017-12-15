# frozen_string_literal: true
RSpec.describe Versapay::FundSource do
  describe '.list' do
    subject { Versapay::FundSource.list }

    it 'returns a list of fund sources' do
      should all be_a(Versapay::FundSource)
    end

    it 'includes the versapay balance fund source' do
      should include(satisfy { |fund_source| fund_source.type == 'balance' })
    end
  end
end
