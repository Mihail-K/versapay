# frozen_string_literal: true
RSpec.describe Versapay::Transaction do
  let(:attributes) do
    { amount_in_cents:    1000,
      transaction_type:   'direct_debit',
      email:              'rspec@company.co',
      first_name:         %w[John Jane].sample,
      last_name:          'Doe',
      branch_number:      '99960',
      institution_number: '004',
      account_number:     '1234567',
      memo:               'RSpec' }
  end

  describe '.create' do
    subject { Versapay::Transaction.create(attributes) }

    it 'creates a new versapay transaction' do
      should be_a(Versapay::Transaction)
    end
  end

  describe '.list' do
    subject { Versapay::Transaction.list }

    it 'returns a list of versapay transactions' do
      should all be_a(Versapay::Transaction)
    end
  end

  describe '.retrieve' do
    let(:token) { Versapay::Transaction.list.first.token }
    subject { Versapay::Transaction.retrieve(token) }

    it 'returns the requested versapay transaction' do
      should be_a(Versapay::Transaction)
      expect(subject.token).to eq(token)
    end
  end

  describe '.cancel' do
    let(:token) { Versapay::Transaction.create(attributes).token }
    subject { Versapay::Transaction.cancel(token) }

    it 'cancels the requested versapay transaction' do
      should be_a(Versapay::Transaction)
      expect(subject.state).to eq('cancelled')
    end
  end
end
