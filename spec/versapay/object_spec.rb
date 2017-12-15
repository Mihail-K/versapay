# frozen_string_literal: true
RSpec.describe Versapay::Object do
  subject { Versapay::Object.new(foo: 1, 'bar' => 2) }

  it 'allows method-like access to attributes' do
    expect(subject.foo).to eq(1)
    expect(subject.bar).to eq(2)
  end

  it 'returns its attributes when converted to JSON' do
    expect(subject.as_json).to eq(foo: 1, bar: 2)
  end
end
