# frozen_string_literal: true
module Versapay
  class Object
    attr_reader :attributes

    def initialize(attributes = {})
      raise ArgumentError, 'Attributes must be a Hash' unless attributes.is_a?(Hash)
      @attributes = attributes.map { |k, v| [k.to_sym, v] }.to_h
    end

    def as_json
      attributes
    end

    def respond_to_missing?(field, _ = true)
      attributes.key?(field) || super
    end

    def method_missing(field, *)
      attributes.key?(field) ? attributes[field] : super
    end

    def ==(other)
      other.is_a?(self.class) && attributes == other.attributes
    end
  end
end
