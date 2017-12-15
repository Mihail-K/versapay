# frozen_string_literal: true
require 'bundler/setup'
require 'dotenv'
require 'versapay'

Dotenv.load

# Initialize Versapay configuration from environment.
Versapay.versapay_host       = ENV.fetch('VERSAPAY_HOST')
Versapay.versapay_access_key = ENV.fetch('VERSAPAY_ACCESS_KEY')
Versapay.versapay_secret_key = ENV.fetch('VERSAPAY_SECRET_KEY')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
