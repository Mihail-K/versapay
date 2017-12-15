# frozen_string_literal: true
RSpec.describe Versapay::Agreement do
  let(:attributes) { { email: 'rspec@company.co', message: 'RSpec' } }
  let(:agreement) { Versapay::Agreement.create(attributes) }

  describe '.create' do
    subject { Versapay::Agreement.create(attributes) }

    it 'creates a new versapay agreement' do
      should be_a(Versapay::Agreement)
    end
  end

  describe '.sent' do
    subject { Versapay::Agreement.sent }

    it 'returns a list of versapay agreements' do
      should all be_a(Versapay::Agreement)
    end
  end

  describe '.received' do
    subject { Versapay::Agreement.received }

    it 'returns a list of versapay agreements' do
      should all be_a(Versapay::Agreement)
    end
  end

  describe '.cancel' do
    subject { Versapay::Agreement.cancel(agreement) }

    it 'cancels the requested versapay agreement' do
      should be_a(Versapay::Agreement)
      expect(subject.state).to eq('cancelled')
    end
  end

  describe '.approve' do
    subject { Versapay::Agreement.approve(agreement) }

    it 'returns 404 when trying to approve a created agreement' do
      expect { subject }.to raise_error(Versapay::Error) do |error|
        expect(error.code).to eq(404)
      end
    end
  end

  describe '.reject' do
    subject { Versapay::Agreement.reject(agreement) }

    it 'returns 404 when trying to reject a created agreement' do
      expect { subject }.to raise_error(Versapay::Error) do |error|
        expect(error.code).to eq(404)
      end
    end
  end

  describe '.revoke' do
    subject { Versapay::Agreement.revoke(agreement) }

    it 'returns 404 when trying to revoke a created agreement' do
      expect { subject }.to raise_error(Versapay::Error) do |error|
        expect(error.code).to eq(404)
      end
    end
  end
end
